class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.22.1/badness-aarch64-apple-darwin.tar.gz"
      sha256 "c489c92472d3aff2c342e2f9647e24afaa54988862cfebda0ebc4199c0390cea"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.22.1/badness-x86_64-apple-darwin.tar.gz"
      sha256 "c453c5c9e1b0d79b2ca553385a26734f22198d16411351f546fae09e771215d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.22.1/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "817f8ce1e763ca155b78864d7b41f27bacc2a59c1dd654e61c199e39ce0bb511"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.22.1/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55a4e7580229392e374c01e2ae14f10e8c4ecf9041045a7e267f30bef380ef4e"
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
