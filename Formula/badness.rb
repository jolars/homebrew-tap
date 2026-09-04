class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.23.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "fe15415762ed4b51eedc6a703742c7f8da30960484c0fbf66ad167d7dbd5bcae"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.23.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "7e5064c6e247ccc2e729c27f8636754ebbac1ebff5278d754f415dc47b0a5681"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.23.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e24674c348e32d9897053b7d83665b307195d1f0afaa0c20962f9b99e22ada9"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.23.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ee929603c19b88e077e1ff189fecf6897298a412a2a18ea4c2d115224b76f96"
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
