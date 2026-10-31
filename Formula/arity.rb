class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.29.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "5ccb2b6d8c356c0747e5fe1b93d0e217bbd03e9186b28cd8e46166f1cd6d907a"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.29.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "8505ec4525f450d9d778715450deeb5e6a2a53d1d88658af6cd401fa6636b2e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.29.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f0a7cfe8cbc49ce53c0398451441a492cc0430b2e0c5e3bab93523ad9cce2ee"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.29.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6bc1a5bd89bf1a5e8f227109de552519eaad8634c33563cc82c3b3a7361bd44"
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
