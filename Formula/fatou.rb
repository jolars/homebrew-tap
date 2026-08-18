class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.15.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "daac192eab321a60e2ba8b16a4f6642f9c338c6b057e38a302cfabd22eb42f89"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.15.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "c15c3512ab1f3815aa644c92bc84becc3a6d36ef99ebc1a83c951dce8d4c9070"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.15.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb023d5b401e0d82dd0a0745e084c5e997c1995f591b48a269978b49bfe93be7"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.15.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5dd86ec6e3b3931c817b1a9fad3301d1ec311b43a192460b7f15c5e3fc7730d"
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
