class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.12.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "3ec4613447300cf54b859bcf064d705499021bb1576d7625affe160450de2093"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.12.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "0b6f886a24420f82a17c72a252964d9125f38b503be99bbdf335c51799358fe3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.12.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b57d6e997552d4b3acae81d4197bc28d7911211615c0ed2295302a32ca84f5e"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.12.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc51298538861176f56102be2f2c2a9fe7585021c612968c2aef4b616b020cf5"
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
