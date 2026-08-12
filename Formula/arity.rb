class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.18.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "70c26f3b185b365da5ebacab76e5d614f2f4de23dc3d0b1077f1b7c124fb8c25"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.18.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "fd9c1e90a085b9cc8ab1448d7cfeb427f2a2302b3a0103842aa78dca328d2d3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.18.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4e6e66178419d2ca12046a8a247af10eabd9792ce3f2cb4ab61e7d810c9e3e7"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.18.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8a1d65fe7e11f9ded88d4644c09fd7706ce25dd6736f4db53353d2c6ee99396"
    end
  end

  def install
    bin.install "arity"
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/arity.bash"
    fish_completion.install "completions/arity.fish"
    zsh_completion.install "completions/_arity"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arity --version")
  end
end
