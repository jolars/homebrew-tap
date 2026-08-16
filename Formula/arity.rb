class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.19.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "dc7a934350c448f0a7539b041f0cc91a4c7e4f3d20d43599a1e2cc1dcc10d65b"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.19.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "182031a063f03285656a7734d919571a248062e118f1ef2748b69856b1df0dda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.19.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5638321cce566a8323056ef3a275ee39f4ac886c73874fbd10f8e96641095d3e"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.19.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73baf1de66bbe779b296d9cbaffdf2b5d531edbe21875fb560c8d696b2b1acdc"
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
