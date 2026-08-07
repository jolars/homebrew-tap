class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.16.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "673c464a51236b455aaa76cb1243b8738266cadc57644aa32f1d4fe22b02aab9"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.16.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "78981bb0b8e78ee1501aa18e8238bfe381c0576bf7ba9b3b1d490d66942915bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.16.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "821b369c22c3aa3839864dad780413072c1651b065712abfc22b42efd8a64184"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.16.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "50212bdb9dc12b21ea475d02420b28411173fb047d06219bdb40837ed18bf106"
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
