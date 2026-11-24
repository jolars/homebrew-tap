class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.16.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "fe646385fbbcee97c0565dadea1b8e2f0274ae3d4d2843d53838d3b324c6a4e6"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.16.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "feb887d51cfc2f238fa9de9ff0a16a8399a3319e76f562b6a505f4056737b1a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.16.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e368497fb4ba4570b2f145a74c91d4a4c5f0a47171b6ab0f78219f0adadc08b3"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.16.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2083ec8d815f5e5bf189cbc69cc600c6b2ec1b3a90daaa392051811132326858"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
