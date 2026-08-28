class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.21.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "1e2890043ab6a9de07f7aedd63026f7f63503669734fd25ffdf8b8d6a3b443fb"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.21.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "6973859892d7b3666028785459e17c9fdb4c144acec9c7254cbc4f9b0360cc2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.21.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "486a067d032f5c9b8532500eec82a86975364dddd01b798e8b76c7b340ef4ad3"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.21.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bfb84b740c7ab5fb70208a54d9256cb6b56e53b2a6a2e6ccb99da5133dd4ab71"
    end
  end

  def install
    bin.install "badness"
    # Man pages and completions ship in the tarball from the first release built
    # with the bundling packages.yml; guard so the formula also installs cleanly
    # against older releases that carried only the binary.
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/badness.bash" if File.exist?("completions/badness.bash")
    fish_completion.install "completions/badness.fish" if File.exist?("completions/badness.fish")
    zsh_completion.install "completions/_badness" if File.exist?("completions/_badness")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/badness --version")
  end
end
