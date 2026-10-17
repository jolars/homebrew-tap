class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.4.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "9b322c9324b99329e38d79cc9c105051b2df109443a1d64f922beb824fd29cf0"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.4.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "e4d61011327bd62826e5a90f16b40a2a2614692cb6e5b52fa2494be9bd6b5a82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.4.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "11de2e096a97835192de77b4ac55ceaef2de24324faa381b1258ed015cf5b027"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.4.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3aa734e822bd3dc55cebbf3ccace8e6193d10bcd7946b7aff1ec75079c7d6896"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
