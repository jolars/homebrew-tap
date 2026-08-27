class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.17.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "f766820f8ef5e1fca0ac17af76185ddedd9a5c426799183605061b2b87143880"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.17.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "f8f4064c68e2c0fe25ca94b1ec1ab82d27155bebeb64b4bad0d0b2b92d6e09bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.17.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fdd6a0472fa3b0301c46d824b11017310007a1c5ac7bb01d08f4d82ea4aac277"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.17.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3ab294bf1360b0da6ba378fb5d791c5de8975918885f9307da84c45dae655bb"
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
