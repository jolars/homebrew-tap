class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.11.1/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "991d54dbd978979458ff7bb8eb2ac176000db731bd0fd59b8db71efba608ac72"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.11.1/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "b7998201e8b550af80dbb17b8ab3500e6c4c22e50cd93b4e18ad9c776bcbb412"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.11.1/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8683826c37549ecc314f9e14dbd68239161a80cd2c9de7bc443f98ac4522d5a"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.11.1/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff41b71fd546c497c329b6d0c1e60581c8d3abe028c180007ea4d564f8216b4f"
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
