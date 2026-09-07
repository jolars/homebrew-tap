#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
helper="$root/scripts/test-formula-in-brew.sh"
test_dir="$(mktemp -d)"
trap 'rm -rf "$test_dir"' EXIT

fail() {
  echo "test failure: $*" >&2
  exit 1
}

assert_arg() {
  local expected="$1"

  while IFS= read -r arg; do
    [[ "$arg" == "$expected" ]] && return
  done <"$DOCKER_CAPTURE_ARGS"

  fail "docker argument not found: $expected"
}

refute_arg() {
  local unexpected="$1"

  while IFS= read -r arg; do
    [[ "$arg" == "$unexpected" ]] && fail "unexpected docker argument: $unexpected"
  done <"$DOCKER_CAPTURE_ARGS"

  return 0
}

mkdir "$test_dir/bin"

# A fake client keeps these tests fast and verifies the Docker boundary without
# requiring a daemon or pulling the Homebrew image.
cat >"$test_dir/bin/docker" <<'FAKE_DOCKER'
#!/usr/bin/env bash
set -euo pipefail
printf '%s\n' "$@" >"$DOCKER_CAPTURE_ARGS"
cat >"$DOCKER_CAPTURE_STDIN"
FAKE_DOCKER
chmod +x "$test_dir/bin/docker"

export DOCKER_CAPTURE_ARGS="$test_dir/docker-args"
export DOCKER_CAPTURE_STDIN="$test_dir/docker-stdin"
export HOMEBREW_DOCKER_CACHE_DIR="$test_dir/cache"
export PATH="$test_dir/bin:$PATH"

"$helper" tomat
assert_arg "ghcr.io/homebrew/brew:latest"
assert_arg "tomat"
refute_arg "fatou"
grep -Fq "brew style \"jolars/tap/\$formula\"" "$DOCKER_CAPTURE_STDIN" ||
  fail "container script does not run brew style"
grep -Fq "brew test \"jolars/tap/\$formula\"" "$DOCKER_CAPTURE_STDIN" ||
  fail "container script does not run brew test"

"$helper"
for formula_path in "$root"/Formula/*.rb; do
  assert_arg "$(basename "$formula_path" .rb)"
done

HOMEBREW_DOCKER_IMAGE="example.invalid/homebrew:test" "$helper" arity
assert_arg "example.invalid/homebrew:test"
assert_arg "arity"

if "$helper" does-not-exist >"$test_dir/stdout" 2>"$test_dir/stderr"; then
  fail "unknown formula succeeded"
fi
grep -Fq 'unknown formula: does-not-exist' "$test_dir/stderr" ||
  fail "unknown formula error was not reported"

echo "test-formula-in-brew tests passed"
