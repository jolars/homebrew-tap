class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.20.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "a458f44bc749c9b6d051bd14d216161f30446bf1afd62d0300bee22539a9fffa"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.20.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "c97b7f3fc30374fc68399df00cc5ff8cfdc2ab88c88190c5cfb579d762566ffa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.20.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9d2bd6edb559ad976c67c002c9036d50fbf773ddc30e07832a2a3702a344a11"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.20.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "594eb79ed3e0c8e6d484d9fd67f7a2c8d8873849105f8042995dcdcdebb30376"
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
