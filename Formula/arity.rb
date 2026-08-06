class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.15.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "7c1547bee4e23569910805bf123eb992b40a4314918a81f36c3d83252a06daed"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.15.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "3e281e2de2642a14b306bb9c1ad027e719210ef3f283a9b93ca9dd3fcaf76f27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.15.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d3e12bfc1e2a7d5fc8c166d0200aea1fdce2b2552e28ca14bde822081e0f088"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.15.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c9178e6056dc7b3a98b64e1bcb18c0fdbb3b8f06c62d76af279ea8bbd8c88b2"
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
