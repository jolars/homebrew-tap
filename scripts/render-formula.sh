#!/usr/bin/env bash
# Render Formula/<name>.rb from its template and the latest stable release.
#
# Usage: render-formula.sh <name>   (e.g. fatou, arity, badness, tomat)
#
# Reads the newest non-prerelease, non-draft release of jolars/<name> (the
# /releases/latest endpoint excludes those), pulls the per-asset .sha256 files
# for the four Homebrew targets, and substitutes them into the template.
#
# Requires: gh (authenticated; GH_TOKEN in CI is enough for public reads).
set -euo pipefail

name="${1:?usage: render-formula.sh <name>}"
repo="jolars/$name"
root="$(cd "$(dirname "$0")/.." && pwd)"
tmpl="$root/Formula/$name.rb.tmpl"
out="$root/Formula/$name.rb"

# aarch64-apple-darwin -> SHA_MACOS_ARM, etc.
targets=(
  "aarch64-apple-darwin:SHA_MACOS_ARM"
  "x86_64-apple-darwin:SHA_MACOS_X86"
  "aarch64-unknown-linux-gnu:SHA_LINUX_ARM"
  "x86_64-unknown-linux-gnu:SHA_LINUX_X86"
)

release="$(gh api "repos/$repo/releases/latest" --jq '[.tag_name, (.assets[].name)] | .[]')"
metadata=()
while IFS= read -r line; do
  metadata+=("$line")
done <<<"$release"
tag="${metadata[0]}"
version="${tag#v}"
echo "Latest $name release: $tag (version $version)"

# Releases become visible before every platform build finishes uploading.
# Preserve the current formula until all archives and checksums are available.
missing=()
for entry in "${targets[@]}"; do
  target="${entry%%:*}"
  for suffix in tar.gz tar.gz.sha256; do
    asset="${name}-${target}.${suffix}"
    found=0
    for uploaded in "${metadata[@]:1}"; do
      if [[ "$uploaded" == "$asset" ]]; then
        found=1
        break
      fi
    done
    if ((found == 0)); then
      missing+=("$asset")
    fi
  done
done
if ((${#missing[@]} > 0)); then
  echo "warning: deferring $name $tag; missing release assets: ${missing[*]}" >&2
  exit 0
fi

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

rendered="$(cat "$tmpl")"
rendered="${rendered//__VERSION__/$version}"

for entry in "${targets[@]}"; do
  target="${entry%%:*}"
  placeholder="${entry##*:}"
  asset="${name}-${target}.tar.gz.sha256"

  gh release download "$tag" -R "$repo" -p "$asset" -D "$workdir" --clobber
  # Files are `sha256sum` format: `<hash>  <filename>`.
  sha="$(awk '{print $1; exit}' "$workdir/$asset")"
  if [[ ! "$sha" =~ ^[[:xdigit:]]{64}$ ]]; then
    echo "error: invalid sha256 for $target" >&2
    exit 1
  fi
  echo "  $target -> $sha"
  rendered="${rendered//__${placeholder}__/$sha}"
done

# Fail loudly if any placeholder survived (e.g. a missing asset).
if printf '%s' "$rendered" | grep -q '__[A-Z_]*__'; then
  echo "error: unsubstituted placeholders remain in the formula" >&2
  printf '%s\n' "$rendered" | grep -n '__[A-Z_]*__' >&2
  exit 1
fi

printf '%s\n' "$rendered" > "$out"
echo "Wrote $out"
