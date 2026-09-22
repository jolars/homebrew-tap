class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.21.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "dd96da4f0b435398d7db09684d031636af1c77696b41834a06880b71ca9e9f87"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.21.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "aea02fa2392c7223626e62d523f0d5e3fe16b494eccc44dbcc1f8265d570bc7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.21.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ff993596071551f2f9f1a08e4479554c1eb387ca3641b13faf6f20dd01df1ca"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.21.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "517eb7768c44a775cecea2a6826d17444d0255cd25e8816d33cd373dc2df69bb"
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
