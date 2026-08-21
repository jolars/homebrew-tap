class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.17.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "b8cef477c75bd67b5718d91c66df1a17accb668a398739ef6a5acf9229d83c43"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.17.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "beb7f37055ba7a6cf001ef99b51fd76a4c6d0e508c38424a029c1f250c8e5fbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.17.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c19e636978cde60034cdff8e34fece2477e4a9b2ae6c33d22dac6dcd4203c0a"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.17.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e6f74edcc02329370e31a3f914cb05d5acb2a00b82f775b52ead0f63e83c0e3"
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
