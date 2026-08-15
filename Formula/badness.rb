class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.16.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "580076f60a9a59ed0deb73e85b2ae4609c3d3a87a7e3761394e1953be93ccdec"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.16.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "6677293ae9e8892fc66fc8aa6576a650a2ca56f51d20a4fa194fed6c5dc53bc2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.16.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ed3223d2551c1a67a991609ee6068dac8aa089104ad7a34ad6de80a08ff9832"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.16.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a2248c35be479518f0b8e57e93bc79f772ceaa7f95254342c9384d34d6954bc"
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
