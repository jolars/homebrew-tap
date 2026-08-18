class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.19.1/arity-aarch64-apple-darwin.tar.gz"
      sha256 "ec693b09c5d760e9dde4b6eec6b951c3adf3f04e60a42e369ec79d7b6f4aac8e"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.19.1/arity-x86_64-apple-darwin.tar.gz"
      sha256 "61bf0ee844dbf4dec6d2bf012c8067ff0a5e6b2881479353362456459cea765d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.19.1/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dab1a1e6365c14c347eec71efc30c097b25c73dbb57660f9d6f2faa3ec24c82a"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.19.1/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee5ac1e6a9507331cf76d4fa0654e284d85792a574600c80b1b40c5536face1a"
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
