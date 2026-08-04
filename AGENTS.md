# Agent Instructions

This file provides guidance to agents when working with code in this repository.

## What this is

A Homebrew tap (`jolars/tap`) distributing prebuilt binaries for three
Rust CLI tools by the same author: `fatou` (Julia), `arity` (R), and
`badness` (LaTeX). Each is a language server, formatter, and linter.

## Formula are generated, not hand-edited

Every `Formula/<name>.rb` is rendered from `Formula/<name>.rb.tmpl` by
`scripts/render-formula.sh`. Edit the `.tmpl`, never the `.rb` directly — a
regeneration will overwrite manual `.rb` changes.

- `render-formula.sh <name>` reads the newest non-prerelease release of
  `jolars/<name>`, downloads the four per-target `.tar.gz.sha256` assets,
  and substitutes `__VERSION__`, `__SHA_MACOS_ARM__`, `__SHA_MACOS_X86__`,
  `__SHA_LINUX_ARM__`, `__SHA_LINUX_X86__`. It fails loudly if any
  placeholder survives (e.g. a missing release asset).
- Requires an authenticated `gh` CLI (`GH_TOKEN` in CI suffices for public reads).
- The four targets are fixed: `{aarch64,x86_64}-apple-darwin` and
  `{aarch64,x86_64}-unknown-linux-gnu`.

## Common commands

```sh
scripts/render-formula.sh fatou          # regenerate one formula locally

# Validate a formula. brew audit/test refuse a path argument, so the working
# tree must be registered as a tap first (CI does this automatically):
tap="$(brew --repository)/Library/Taps/jolars/homebrew-tap"
mkdir -p "$(dirname "$tap")" && ln -s "$PWD" "$tap"

brew style   jolars/tap/fatou
brew audit   jolars/tap/fatou
brew install jolars/tap/fatou           # downloads + verifies sha256
brew test    jolars/tap/fatou           # asserts `--version` matches
```

## CI

- `.github/workflows/update-formula.yml` — daily (and on-demand) cron.
  Renders each formula; for any that changed, runs style/audit/install/test
  before committing and pushing. Bot commits with `GITHUB_TOKEN` do not
  trigger `test.yml`, so validation lives here to avoid shipping a broken
  upstream release.
- `.github/workflows/test.yml` — on PR/push, runs style/audit/install/test
  for all three formulae across ubuntu x86_64/arm64 and macOS arm64. The
  `x86_64-apple-darwin` branch is intentionally not exercised (Intel macOS
  runners are being retired); it is covered by symmetry with the arm64 mac
  branch.

## Template conventions

- `desc`, `homepage`, `license`, and the `install`/`test` blocks are
  authored by hand in the `.tmpl`; only URLs and sha256s are substituted.
- `badness.rb.tmpl` guards completion installs with `File.exist?` so the
  formula installs against older releases that shipped only the binary.
  `fatou` and `arity` install completions unconditionally.
