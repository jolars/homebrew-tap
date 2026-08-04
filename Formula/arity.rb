class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.14.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "4f2e4ce863380723117e7d911c4d9a2f737058c391f5bc993dd518d3ca91d296"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.14.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "b43bdf85cc5bbba0073b84c37dee08f73fdb58f65691aca1220a36a2c27f6895"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.14.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1daa3ec2de8d67c424b3427a72de5820b54d72d4f6ebfc7a555caa2d3d84487e"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.14.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9fb375924767b9574b8b2fe1738855097aeb338322f22d23ecf04cea3e8bb856"
    end
  end

  def install
    bin.install "arity"
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/arity.bash"
    fish_completion.install "completions/arity.fish"
    zsh_completion.install "completions/_arity"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arity --version")
  end
end
