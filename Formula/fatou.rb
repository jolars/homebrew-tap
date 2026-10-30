class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.25.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "c57737034ad2d587f3f2f21a9e269dba2b44142b124f0f7237a8faf4a10579d3"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.25.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "a1a9a1f75619da3524360741279d4df7d13bbfe09bfc551114189d24bcc4a36a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.25.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fe210a9b1e4a3524266334fbda4701343cf4ee122e94503cf0f986c211ec0fb"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.25.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f58970468b7440c388baa0b626d8352f08db833f82cc8880ec9e0becbd0bd6b"
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
