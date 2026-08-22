class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.20.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "155f68e04da1a18469aade48dffab5e5f458847c1d21b5917e21fea2b831d11a"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.20.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "464ac47bcbb53d3699b391f248d43f7c29e0eeefed63218b0413b895267e8d89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.20.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c69567bc489756fe4955e1983dce732d890e8b46cc93d64b0537f4f86528a413"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.20.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6237d7c193bd10fc5feabb462164baba8e5276eeb1de89176e1ec9e69e391fe9"
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
