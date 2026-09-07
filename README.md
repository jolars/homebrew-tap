# Homebrew Tap for jolars

A [Homebrew](https://brew.sh) tap for [jolars](https://github.com/jolars)
command-line tools:

- [fatou](https://github.com/jolars/fatou)—language server, formatter, and
  linter for Julia
- [arity](https://github.com/jolars/arity)—language server, formatter, and
  linter for R
- [badness](https://github.com/jolars/badness)—language server, formatter,
  and linter for LaTeX
- [tomat](https://github.com/jolars/tomat)—Pomodoro timer with daemon support
  for Linux and macOS

## Install

```sh
brew install jolars/tap/fatou
brew install jolars/tap/arity
brew install jolars/tap/badness
brew install jolars/tap/tomat
```

Or tap first, then install by bare name:

```sh
brew tap jolars/tap
brew install fatou
```

Tomat's background daemon can be managed through Homebrew:

```sh
brew services start tomat
brew services stop tomat
```

Use these commands instead of `tomat daemon install` for a Homebrew-managed
installation.

Each formula installs a prebuilt binary along with its man pages and shell
completions (bash, fish, zsh).

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

## Development on NixOS

Run Homebrew's Linux checks in its official Docker image without installing
Homebrew on the host:

```sh
scripts/test-formula-in-brew.sh tomat      # test selected formulae
scripts/test-formula-in-brew.sh            # test every formula
```

The container is disposable, while `~/.cache/homebrew-tap` retains downloads
between runs. Set `HOMEBREW_DOCKER_IMAGE` to test another Homebrew image or
`HOMEBREW_DOCKER_CACHE_DIR` to move the cache.

The devenv exposes the same workflow as tasks:

```sh
devenv tasks run tap:check
devenv tasks run tap:test --input formula=tomat
devenv tasks run tap:test                   # test every formula
```
