class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.29.1/badness-aarch64-apple-darwin.tar.gz"
      sha256 "fc51978b2f06b29524315e47bbd180876f9343497164465732c16b1b36075ea8"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.29.1/badness-x86_64-apple-darwin.tar.gz"
      sha256 "259a7921f60eb6f20fa6e87721ee27e36ebbc8960a23ffc76a0c98d9d2a19625"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.29.1/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbbbdc854d0eaef4d9e96329995a0791f53f2f92fc1b825179697242effec674"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.29.1/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de9eb6bbec9fd66341f3220f00bfe70c244ada80b99b1d04684c343cec7e9f90"
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
