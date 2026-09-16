class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.20.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "0b7a51720fc395263556083e47df69a2785a093d0ece02a62ccedc993351b0fd"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.20.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "0b37e719919a94423ff1c600372177ac5c20888dc093794b1b3a59cd761379dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.20.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b22005617eb6dea05e713ace5c65712c5ca24677ba3e52d0a76c47010fbce3cb"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.20.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb0394ed75bf78838ada9587f08f6f7ff39700811d0439ef6d285bfefae7ebde"
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
