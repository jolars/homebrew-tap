class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.26.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "ed7bbaed733a1c663f157724fd5a7d794093e0599223ee03f696c3340a9d034a"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.26.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "2ecccb42f599b017b1e61718b43365d29bdaacb8b9d9e6916eaf693a0fefb6c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.26.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d0f494858de8c47f3a5e1e841b7ae6a97ca5403bcffa3418a023d55c85b0dc2"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.26.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe8da67839080aee9ef48e3eac8341d3c8cbe181b19ac017185b8fca30de2bac"
    end
  end

  def install
    bin.install "fatou"
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/fatou.bash"
    fish_completion.install "completions/fatou.fish"
    zsh_completion.install "completions/_fatou"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fatou --version")
  end
end
