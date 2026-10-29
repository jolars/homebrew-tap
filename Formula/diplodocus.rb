class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.11.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "39e10b9e4a06c913f16362522bc7e94a3a5f31c23215669a0c6bdfb5c32ec3c2"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.11.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "441f648431e5c6676edd34d552f54c29d1cceee8de8236d17a6659ad58cabfb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.11.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "db0243ec9a0fcb42f26d52901efa2d890529644784394f8bcfb3db429db9ac7b"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.11.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ba96104bf577893fdc0a787e79f2abd7771bd01c30c5bac0dc5223f8b181f31f"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
