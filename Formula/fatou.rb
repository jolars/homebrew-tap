class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.14.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "07d94f58aac1f27101a0fcf6ad5fc531ce7146ea5abda47a9ae718f82a2a3041"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.14.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "c40fe41bca5239e9d01096eb9551cbcb823db5497cdc794a60f6b360469b005a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.14.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5ed1fa32f2b150ce4a731a9e99dc0cbb5bc3fe69617294ce7ef153d6f98f360"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.14.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19c80eee9e981f4dc93626864b6e5e82f4b39f4781565fa2472c8f586ea77c58"
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
