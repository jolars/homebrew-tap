class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.25.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "d3c08c087ade64d88a3c85fb90faa3100a5fc67b5db3ba9eef1b210d0db8ac7b"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.25.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "38079f5d6f04f250810b076a9a5b29ba597181ecb6646464c618647bf4a0e753"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.25.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "089114184ac74b376b29bf3b7abe3a93b424bb109b1d9c96968509268a70674d"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.25.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81d587d64995c2801298c83d201a1b2d321c6dd07636a19d47a06d535d209d3f"
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
