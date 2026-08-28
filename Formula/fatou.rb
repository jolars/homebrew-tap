class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.18.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "e6ef7033fa80e8e19fcaa6e19308a4c2636a9fe407c5a848f87043e76b6fa69b"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.18.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "fe9395a5c0b4960f2ec63dbf596b35c72d317778a9419e4cd54b9aabc5069968"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.18.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d61b4cacbd075e54abcc9ea96cffd1d0e0295933d4ec4c9585e3f6c6787622c"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.18.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d03842c02b11d03a685744a30c81f3d0b7ef1bf7a591b01be7590d776d468418"
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
