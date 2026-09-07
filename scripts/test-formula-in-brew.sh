#!/usr/bin/env bash
# Run the tap's Linux validation in Homebrew's official container.
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
container_root="/home/linuxbrew/homebrew-tap"
image="${HOMEBREW_DOCKER_IMAGE:-ghcr.io/homebrew/brew:latest}"
cache_dir="${HOMEBREW_DOCKER_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/homebrew-tap}"
formulae=()

usage() {
  echo "usage: $(basename "$0") [formula ...]" >&2
}

if ! command -v docker >/dev/null 2>&1; then
  echo "error: docker is required" >&2
  exit 1
fi

if (($# == 0)) || [[ $# -eq 1 && "${1-}" == "all" ]]; then
  for formula_path in "$root"/Formula/*.rb; do
    formulae+=("$(basename "$formula_path" .rb)")
  done
else
  formulae=("$@")
fi

for formula in "${formulae[@]}"; do
  if [[ ! "$formula" =~ ^[a-zA-Z0-9@+._-]+$ ]]; then
    usage
    echo "error: invalid formula name: $formula" >&2
    exit 2
  fi
  if [[ ! -f "$root/Formula/$formula.rb" ]]; then
    usage
    echo "error: unknown formula: $formula" >&2
    exit 2
  fi
done

echo "Testing ${formulae[*]} with $image"
mkdir -p "$cache_dir"

# User-owned bind mounts keep both the source and download cache writable by
# the image's unprivileged linuxbrew user.
docker run --rm --interactive --pull missing \
  --mount "type=bind,src=$root,dst=$container_root" \
  --mount "type=bind,src=$cache_dir,dst=/home/linuxbrew/.cache/Homebrew" \
  --workdir "$container_root" \
  --env HOMEBREW_NO_ANALYTICS=1 \
  --env HOMEBREW_NO_AUTO_UPDATE=1 \
  "$image" \
  bash -s -- "${formulae[@]}" <<'BREW_TEST'
set -euo pipefail

tap="$(brew --repository)/Library/Taps/jolars/homebrew-tap"
mkdir -p "$(dirname "$tap")"
ln -s "$PWD" "$tap"

for formula in "$@"; do
  echo "==> Testing jolars/tap/$formula"
  brew style "jolars/tap/$formula"
  brew audit "jolars/tap/$formula"
  brew install "jolars/tap/$formula"
  brew test "jolars/tap/$formula"
done
BREW_TEST
