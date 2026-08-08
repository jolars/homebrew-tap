class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.15.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "fad45657c9a923f2006fd7026a2f937a8ee7d76a0d7ad1a055fe3e5f39078048"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.15.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "6a2f4b7636b703a502bc3b545e383cf8729f60d960c1421f88978e457069b993"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.15.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36dc93becc287c6ae7fd2a0dc092f520b704c9bccd3cadac05e38d2901ed9095"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.15.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "038743b308db864d0a0cc3ba1f0f34d4b2e7b0bc5448fab2cd04334e36f726a5"
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
