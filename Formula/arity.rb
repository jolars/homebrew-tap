class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.28.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "33e84cb8fcd5aeedd1dc1716680b6767faab313c53944faadc78b3fe8d110857"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.28.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "6ae6da9924dcc6e56b190186c6d1231434f485e0a1ce40aa163dd4d7e91c3557"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.28.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5bf82827e15c07c55b79fcd8410d1768932b71e6e6f168c1e7bb86542f6bfc04"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.28.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a47ca3728ba1bfc3c112f775690e84ba98c7e4ed3121fedb10a20f25f3aacee"
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
