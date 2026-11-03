class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.29.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "e482424a69c42859379c44899e87cfff66cfd22fa98b367386bf422463fa88ac"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.29.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "0edd82ccf30f1cb1d99f62fff47df358a8eca115b96590081454179b0af393f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.29.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "546cb6daa4b4dbd1bf6c8b887277900f22f59d199a2c13f324bde786af4b7fac"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.29.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf23e622018d5af05872ce6dfe477d5bf920bcf61cab8cb8d04ddcf6a4d932d7"
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
