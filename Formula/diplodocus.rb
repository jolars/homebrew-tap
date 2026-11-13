class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.14.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "5e52f6ed8de85eb072475d29e29383676535375b55233aca4380127d992d1e64"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.14.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "35c06c6f05e5aabf0fd7a003d1942653288ec0041871bd4139305db6f6f4f023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.14.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d47a01711046f6ca7f45bf98a5c9e842ad97b5636435e53b770240957a525c8a"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.14.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8369bd7c996dc8f4c8da59a3d74877a0004d55cfe79afa59169b145a6ceff453"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
