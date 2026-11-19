class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.27.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "af4cf69db01b0c7b485f9d87b78891aa1758438870999b2e8031d792a2c49aa9"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.27.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "64258ec9557769bdc02d4a1d8f2945db8ed3247eeae1da93b6053775e45fdeac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.27.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e92f25b082f8807d332de76708d56689c523f11a9f4a06c273222ab8cca2162"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.27.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4b4dc057809bb0af5bb2ac7aff126e7b2d4213364776def8a385b0a22ab6ff6"
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
