class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.14.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "91fe2110a497ce268ee549bc1e44df8be70237e6c47d3bcac3be532a3bf07898"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.14.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "227cab9aad463284649a2dc330b387b1b420c191423377f7e646941e3be830fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.14.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2bf1cb6a78337370241f48dbb192a021d6900fd89575d70e914b4527858f9a42"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.14.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8aeca7aff502c09ea2ee9849f99e9e5bb4a997bdb1069e4c06aa6b6b7305fca"
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
