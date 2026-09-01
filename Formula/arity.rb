class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.22.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "547d217a00201c23a79c11e386291818cd50574d32a64ca8ea303ca2bf965ac7"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.22.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "e20316ff42eeeeae1fdea0a1d18d9ba9283397f7d3f8ae298d4be99e9e6561fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.22.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62dfeeae83110b82e5bb63950973e91802add21b039ce054898003f73b15bce1"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.22.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa20b2aebca0f6d3330fe3aefd2ded9681f4b30702d0cd8df609baffeda654b9"
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
