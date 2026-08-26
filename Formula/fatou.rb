class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.16.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "d8a7dcb89b7f2fb18cbd0425de1715e9d369c93e53032a6630ccb48c462a1bd1"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.16.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "56791e8fdb7975fb304084301e6e4e5d79996ddcf90679a70d45d97ba6dfb7b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.16.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e54cba66c47fce5503143ee908a6563d4f08a4e0441587248f68d61217ccf5d0"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.16.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47064ebc5b18537975f90456c7cb718dd2ba488b8650d3b5ffc322c0d4766b9f"
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
