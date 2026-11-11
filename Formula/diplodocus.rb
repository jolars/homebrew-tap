class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.13.1/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "7217b5fe881af157079618d6adcc9b07bcf5881a8748af6a751a426f7f2137d7"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.13.1/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "80c2aec1b61ee371f7f8716eca661c2033aae0f4c13d2e9230cdc370ce435848"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.13.1/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6bc5d1c499e02538c4d584f7fc6f02fca3e72d775faa6f3499add04e4adf993b"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.13.1/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2b5b6810dfc4716193fc2cb208299f428e4f83b2c2d27f08ed7569da92572005"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
