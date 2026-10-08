class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.26.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "c39831b4c20db25c754f0fc0cdc5d2d86a4ef4f422f7d3c44e1213ca30a4a691"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.26.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "e5bfb266d9d3e6b5aff48951ad16ec32057ba6269a0d2a0e079e906e74d612ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.26.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "52d9af77b2cb9c076255ef5394b3258ed49397563799561a159e27ffc7099f39"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.26.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "faad485e28aeed91d6b832811977b2a4cc7448ec2d1170fe9d2364fe870e0939"
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
