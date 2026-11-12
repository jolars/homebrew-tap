class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.30.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "303fcd951633b0db36aa27ba18a0ddb8d1053e9dbc36d71874e2c198126755cb"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.30.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "0cd53227a97095f2fbf29668e61a62a5bb4273946c66996d770c20a44bef7d85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.30.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc7acf37c02166ea16627bb1ae8337e51d1219c7a6b130de10a935b9e3aacc24"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.30.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "187f299a718a2f3ed5ef7a9fa3b84b4686cdeef2ccea2b6b946e911673062b70"
    end
  end

  def install
    bin.install "arity"
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/arity.bash"
    fish_completion.install "completions/arity.fish"
    zsh_completion.install "completions/_arity"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arity --version")
  end
end
