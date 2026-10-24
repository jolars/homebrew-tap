class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.7.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "9a1aafdf1de27ee5174bbb456ef66c0111e343b77ba92fa5e5efb06fef662f6b"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.7.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "7ab20bd1a481ee2a2d0d1ac3df34d05e827e582cf51f544a0011ffe14cfff485"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.7.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f392b64ef91b86e9fe8120183524c6a3972c08f1f0a342198310990dff17158e"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.7.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a798f04a1c7ff92494d30862a27be36231e9c71fd811c4eef28643921c557984"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
