class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.30.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "41e4fb5ab58bfd5853b8b242f3015d9cf51ebff7c4d12b4672881dbb9e683a13"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.30.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "a3c4b0b0963ca0949f28f933fc507a6005a30baad853cc832591b034936652cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.30.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6f202f4d22e608de223c03d8daf51658d64975f5139607bed56ac6ced6dc693"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.30.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fef131bebb977000af53a0276d5285d4dd5edfe9331f582bc17990c90661b248"
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
