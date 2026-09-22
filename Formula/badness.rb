class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.24.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "8918ac85fe556cf50f474a055ff88ec62acb83ff4957ae854db5e8e7496f4e3f"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.24.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "5c9f59469bea33c80e62dfd4b4bc26e10abe77c7412be138e246386344ebc89f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.24.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e15983d0ef77e5a1d5b19cff93be75628b92c33275fdccce5f68c6c2464d166"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.24.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d42c51ad8fa9a719c369434b44d314c8cfd360e3fa70b2730c2b6253f99eb609"
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
