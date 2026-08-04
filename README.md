# homebrew-tap

A [Homebrew](https://brew.sh) tap for [jolars](https://github.com/jolars)
command-line tools:

- [fatou](https://github.com/jolars/fatou) — language server, formatter, and
  linter for Julia
- [arity](https://github.com/jolars/arity) — language server, formatter, and
  linter for R
- [badness](https://github.com/jolars/badness) — language server, formatter,
  and linter for LaTeX

## Install

```sh
brew install jolars/tap/fatou
brew install jolars/tap/arity
brew install jolars/tap/badness
```

Or tap first, then install by bare name:

```sh
brew tap jolars/tap
brew install fatou
```

Each formula installs a prebuilt binary along with its man pages and shell
completions (bash, fish, zsh).

> [!NOTE]
> This tap replaces the former per-tool taps `jolars/fatou`, `jolars/arity`,
> and `jolars/badness`. Existing installs migrate here automatically on
> `brew update`; no action is needed.

## How it stays current

Each formula is regenerated automatically from the latest stable release of its
upstream project. A scheduled workflow
(`.github/workflows/update-formula.yml`) checks daily, validates any changed
formula (`brew style`, `audit`, `install`, `test`), and commits the update; it
can also be run on demand from the Actions tab. No credentials are stored: the
workflow reads the public release assets and commits with the built-in
`GITHUB_TOKEN`.

To regenerate a formula locally:

```sh
scripts/render-formula.sh fatou   # requires an authenticated gh CLI
```
