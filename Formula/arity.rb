class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.24.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "c94557c3ae873e5eeaf2ce132a1fdb056c30305d04948e9f627d248a4368f390"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.24.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "ab17c80976303d8913f0ea83eec752e4a94650a52bb5907b13d656562e26f98e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.24.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "917a20016edb4b122ddb87f67c3d6103cbdc8085f7433eff3ed3eeba7b4c9805"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.24.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b697b066449e0b93d91377a0699c9b70a486d50769450c80904637371f355b0"
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
