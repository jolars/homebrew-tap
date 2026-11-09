class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.26.1/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "d19654cfd44aff2412da76dc639a23b8902bad8eb36c3a8f87ae0da60d0e9bac"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.26.1/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "a87e5d1b1118ea398f68886c22525c87c31c06318e27e1f8bfa3b896031d5ebe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.26.1/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62daba78ba7e17dec6cc325132eb271eeb509d6ccacfcad31ec8bd5433e4c4af"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.26.1/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a53c468022dfd8124badfdb8bb6ca6dab8037d0178cb45115cd4505e3ad0706e"
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
