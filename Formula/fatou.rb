class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.24.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "32ab2a1aae4e7d014db067fedfeb78c530b22b7122e295b5e9a71e740c821636"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.24.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "474a6003705ac137ede1ceb9ba9d273ffd9f23c3d70542690f95a482233a2926"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.24.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "034dc5ce27bb518308e3bdd82cea3684e565d027f8e40e66a87d16cb878d473d"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.24.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f1aaa6fbe4a23adfa1b8ccb6054247427d1edad470344acf31d8597118d899b"
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
