class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.13.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "efb37a66334cf46652f0d32b2f92aaf5fae0f78ce76045768de69957bd102544"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.13.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "34c822088cfca46d8cbbf4fa9e367cb2386e7427fea5fe83c25482bc247935a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.13.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ec267f0b61b96a0f699e2a3b8e4571929d05039a09d031e41fa8d6e49286afa"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.13.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74c2d47fd2ac3bdaf406c67177a62f977895fd421d6039e59ad1153edeb25a78"
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
