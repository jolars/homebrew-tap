class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.19.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "60700d8c9b7775658ac7f984e3f23511462c10b3d2814bb3d7f41e062ffc1307"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.19.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "1c51ffac5b8fa66d617fd7404d06138c199293bed07262b687db4db805885df3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.19.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c47992f95a8ba6ed804e77622d064ed53431c73b4c835e94e18b9960839651d"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.19.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ceb239c0ca8ce6ed62385c964c4e7c7031f62e2c40a8ea66355ab17f220b365"
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
