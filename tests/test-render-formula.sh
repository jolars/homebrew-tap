#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
test_dir="$(mktemp -d)"
trap 'rm -rf "$test_dir"' EXIT
mkdir -p "$test_dir/bin" "$test_dir/scripts" "$test_dir/Formula"
cp "$root/scripts/render-formula.sh" "$test_dir/scripts/"
cp "$root/Formula/badness.rb.tmpl" "$test_dir/Formula/"
cp "$root/Formula/diplodocus.rb.tmpl" "$test_dir/Formula/"

fail() {
  echo "test failure: $*" >&2
  exit 1
}

cat >"$test_dir/bin/gh" <<'FAKE_GH'
#!/usr/bin/env bash
set -euo pipefail
if [[ "$1" == api ]]; then
  [[ "${GH_FAIL_API:-0}" == 1 ]] && exit 1
  cat "$GH_RELEASE_METADATA"
else
  echo download >>"$GH_DOWNLOADS"
  [[ "${GH_FAIL_DOWNLOAD:-0}" == 1 ]] && exit 1
  asset="$7"
  if [[ "$asset" == "${GH_MISSING_ASSET:-}" ]]; then
    echo 'no assets match the file pattern' >&2
    exit 1
  fi
  printf '%s  %s\n' "$GH_CHECKSUM" "${asset%.sha256}" >"$9/$asset"
fi
FAKE_GH
chmod +x "$test_dir/bin/gh"
export PATH="$test_dir/bin:$PATH"
export GH_RELEASE_METADATA="$test_dir/release"
export GH_DOWNLOADS="$test_dir/downloads"
export GH_CHECKSUM="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
helper="$test_dir/scripts/render-formula.sh"
formula="$test_dir/Formula/badness.rb"

write_metadata() {
  echo v0.26.0 >"$GH_RELEASE_METADATA"
  for target in aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu; do
    for suffix in tar.gz tar.gz.sha256; do
      asset="badness-$target.$suffix"
      [[ "$asset" == "${GH_MISSING_ASSET:-}" ]] || echo "$asset" >>"$GH_RELEASE_METADATA"
    done
  done
}

# Missing archives and checksums must defer the release before any downloads.
for suffix in tar.gz tar.gz.sha256; do
  export GH_MISSING_ASSET="badness-x86_64-apple-darwin.$suffix"
  write_metadata
  echo 'existing formula' >"$formula"
  : >"$GH_DOWNLOADS"
  "$helper" badness >"$test_dir/stdout" 2>"$test_dir/stderr" || fail 'incomplete release failed'
  [[ "$(cat "$formula")" == 'existing formula' ]] || fail 'incomplete release changed formula'
  [[ ! -s "$GH_DOWNLOADS" ]] || fail 'incomplete release downloaded assets'
  grep -Fq "$GH_MISSING_ASSET" "$test_dir/stderr" || fail 'missing asset was not reported'
done
unset GH_MISSING_ASSET

write_metadata
"$helper" badness
grep -Fq '/v0.26.0/' "$formula" || fail 'version was not rendered'
grep -Fq "$GH_CHECKSUM" "$formula" || fail 'checksum was not rendered'
if grep -q '__[A-Z_]*__' "$formula"; then
  fail 'placeholders remain'
fi
[[ "$(wc -l <"$GH_DOWNLOADS")" -eq 4 ]] || fail 'complete release did not download four checksums'

for failure in GH_FAIL_API GH_FAIL_DOWNLOAD; do
  echo 'existing formula' >"$formula"
  if env "$failure=1" "$helper" badness >"$test_dir/stdout" 2>"$test_dir/stderr"; then
    fail "$failure succeeded"
  fi
  [[ "$(cat "$formula")" == 'existing formula' ]] || fail "$failure changed formula"
done

echo 'existing formula' >"$formula"
if GH_CHECKSUM='' "$helper" badness >"$test_dir/stdout" 2>"$test_dir/stderr"; then
  fail 'empty checksum succeeded'
fi
[[ "$(cat "$formula")" == 'existing formula' ]] || fail 'empty checksum changed formula'

echo '__UNKNOWN__' >>"$test_dir/Formula/badness.rb.tmpl"
if "$helper" badness >"$test_dir/stdout" 2>"$test_dir/stderr"; then
  fail 'unknown placeholder succeeded'
fi
[[ "$(cat "$formula")" == 'existing formula' ]] || fail 'unknown placeholder changed formula'

# A new cargo-dist formula must render from xz checksums without a prior formula.
export GH_RELEASE_METADATA="$test_dir/diplodocus-release"
{
  echo v0.3.0
  for target in aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu; do
    printf 'diplodocus-%s.tar.xz\n' "$target"
    printf 'diplodocus-%s.tar.xz.sha256\n' "$target"
  done
} >"$GH_RELEASE_METADATA"
: >"$GH_DOWNLOADS"
"$helper" diplodocus
formula="$test_dir/Formula/diplodocus.rb"
grep -Fq '/v0.3.0/diplodocus-' "$formula" || fail 'cargo-dist version was not rendered'
grep -Fq '.tar.xz"' "$formula" || fail 'cargo-dist archive format was lost'
grep -Fq "$GH_CHECKSUM" "$formula" || fail 'cargo-dist checksum was not rendered'
[[ "$(wc -l <"$GH_DOWNLOADS")" -eq 4 ]] || fail 'cargo-dist did not download four checksums'
if grep -q '__[A-Z_]*__' "$formula"; then
  fail 'cargo-dist placeholders remain'
fi

echo "render-formula tests passed"
