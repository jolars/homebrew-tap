class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.3.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "f6834b2388e57de12ec474d4aff4bf993e7eefa8d49f40ab3418a6704427b1a5"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.3.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "6400fd342eec321ad2f9f452ed2e2f978279d9d41b3763477cddd49b2bcd4166"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.3.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "055948f75340089f622e90513120b7ca9e78276948211b1a33ab1e28c5b33bc1"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.3.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "03016172267d295fb77c15c672ce61ed6b2f9848af65fede7a10a0941dccc635"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
