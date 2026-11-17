class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.31.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "55302c5427b6ec647d74c05bec3070e5042d69e0b0da5a432ed7e615c90d51df"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.31.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "83e53f042be5dde2629024d7b8c9efd82b008122896bbb98ea06c5998b8d6661"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.31.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bed6d9c15c7a5ee21d6bb27b5e168090e33183c0830caeff25216cc88fe658e5"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.31.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0315b2089e72e78c685a1dc39275de0bf70276d37508e4435bff65ade7ffba53"
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
