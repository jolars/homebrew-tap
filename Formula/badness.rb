class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.13.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "09756c90f8125fef0ab37a6969dab22c16f56f11192aa1f2e1bc78f837d8a945"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.13.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "6ee20b6c6853633628748f93c28d95f76847934d5070dd8c8f6a7e0790d204bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.13.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2026fffeb84437640fb44dc8dae3f721094a64f26cac681ecd543dcbbf9b924"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.13.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a9e9bfbcb11c535863350994f15a26cf8c7f3eb29681ceda65b88a2cee38b95"
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
