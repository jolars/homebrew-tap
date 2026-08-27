class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.21.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "e2ae256bbbd21c2c90b49a523b0cc46abac0c9c611ac6b9722b3d1a01b7a9170"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.21.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "bf12821d0f22d4db36d3ec3d9c2514a377bc52f04b8d90ea2cbf4ae727717001"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.21.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "84f9b91e323c2c9af9855e83a7a123442503c70daa5037e337bf5de8d64eaa75"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.21.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c4c6e16d930d8c93e1bc9b72cf43e5343638034b0c4d38a80e7e03b41660570"
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
