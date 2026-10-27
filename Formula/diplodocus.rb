class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.8.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "af488c0811899abf5e1df8599aaab45e893a11425c25ef7ba539b597a24926ec"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.8.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "6879ef6c484c06f96d0f289111d38eb6afe853237b2c3716c61244ddba6f7567"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.8.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7169bbed5310946d7214f9314c1ab5717a2b997975750f6f31c0382e15dbddfe"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.8.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f34ae120cd9f7db700965ba4241a5f9cc1df01e46c74b7a2663152035b1f4e65"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
