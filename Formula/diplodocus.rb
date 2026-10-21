class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.5.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "617c6770d1bd8f082cece174df3453ae59d04c4308f9825a067e59c85e1f7c0e"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.5.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "e073271f0e87a476e9c21bbfc092e4daadaca6105c4f447a43e85cc6bd269c06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.5.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e95d5800f9fcdabe91b671b66138d08cf32c4f3fa704fb9297ed9e919c921065"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.5.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4a34ad746cd2e5f2a3ece2acf792e1cbb84accdaecbc54efab7596690a9608d7"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
