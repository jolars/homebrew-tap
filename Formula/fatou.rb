class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.10.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "1845818a7a88916e3245be18ee1eeab67d3e665940c885d24d89d8f39aba6858"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.10.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "8365b49d3e4924e7d0ea786f27dbc64971527c9808a1155107c25b98890c880e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.10.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0288b4a576f9525ce3fe16857e091b8e7617ca306bf44026e431b54dc6854d09"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.10.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c6a706de5e23f5f8a18bcaae26d04dba7537c9dad58c2c024bbb7ef59fb3a5d"
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
