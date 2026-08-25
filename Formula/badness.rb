class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.18.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "c3c3ab802e1e7726e9cc6ac51f055f87464ba029de42390a545bec9c38514449"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.18.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "5550d1000c65eb2f0773be541e6bd0c23f8d00ea8b2b2ffc3bd9e30c72aebfcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.18.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd48eedc8992ebdf2945a643b431ddb87ecb193d4980b7d54da79f4fdb913360"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.18.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99ee5c83a2b1072d27df7d69ae1bbdef782f962807683ec3262d85a3d9885ebb"
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
