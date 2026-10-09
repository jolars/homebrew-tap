class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.27.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "7e72a89859bcc6c3651b355f5c650f8b9fa599cde0b9cc82ac5c09e4c2ec90eb"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.27.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "004d0f667ca53e5f379465f2d077efd1350922b6235f3afd7480af2c266f219d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.27.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "845d4c92f4f3b08b77658e4171d5bfa6216c1947487578c469604f7dca5a186e"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.27.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f3beda316406761abe00779152edd048859935ae3999f1ceb09be1fc39ceed6"
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
