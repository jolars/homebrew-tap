class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.19.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "707bc96398bf3cc4d5e6ae5678d0e520d3a1286f82689358c53cb50b088411b9"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.19.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "865fce8808d6eaa6f69bd5fb8d1091136fbff4d7d250c8e69624bfb66ebb2bfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.19.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4d9cd2f7290004959ff36b1e7f36e57cb5550d4216bf05e78326706c378a0e0"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.19.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e8414bb79582bb985ee565cf525dfb0c2197ed8994250feb723a8d18fb4e5ff"
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
