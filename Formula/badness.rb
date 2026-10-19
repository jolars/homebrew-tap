class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.28.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "1f796e6a9a3919aaa563dd9600a3a52bc018f13702f54e91ef63a78b6a1d0194"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.28.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "f11813f0ceda732fb9d31e581508a69f749085e246bc8fb5907ae90c26c73877"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.28.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08f4eac04f50f7df4b41ef512e24f2be7b05533276e5fac792e4b62b839a9749"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.28.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c08f375793dab0f7351eb7860235f98aab3f0665c9fc17b3058c9990ad4ce287"
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
