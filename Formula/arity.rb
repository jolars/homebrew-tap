class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.32.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "16f9ba44991bd54c60ce53fed58178d3aa097831c3141b5fd68979317837704d"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.32.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "71ece53355f62c8649a64d25bff8767ba13d1b60d5fdf948d8d1f4b5d2c07d3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.32.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c80442cf220fc6999de6d51a2e0fd6e8c00024f77425ee8c491a3fc0f985b1f"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.32.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c747a35100564f64f94f9cd7eaf60bf08042c87d7498e17c475dabfe7e54eaab"
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
