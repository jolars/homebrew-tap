class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.22.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "aac1b514be5a47bdb7bf068963a25e4af1491be3bad606991c0ed5fb0591c830"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.22.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "23c1f516654eb428debee1ec998ef293152feb48acf0d4da3f85b70f8f938905"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.22.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5b0bc8660eb7f8397a85d548438275f8c89cee5ffe275f8c278db44bba9ec8f"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.22.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efe6cff9175bcf4b8414f833051fb710886c404932fb3afa9841d7ed4f57683c"
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
