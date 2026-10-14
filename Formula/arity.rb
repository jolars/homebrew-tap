class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.26.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "a01cf26f01875f1a53af12d1a2b4ea5166b89a6cdbf6a474f9725a1bbd9e70c4"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.26.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "3100c33b9cecbf99fd04b0e39bdae409af963f23957a0fdf126e04e9c01bbfbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.26.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0ba639cbd7577f6527807079856e58b3520f3b5f31f2d77e743a0f72707762d6"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.26.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79bff26be0f0f01368ec5e5eb8a8eb4f2d4ca61ed680b3cc0327eb8ca8de9ab2"
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
