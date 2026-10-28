class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.10.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "5f99e3507ee699b7eb83792c5a04e3545d501333eccc734acec7d2a0190dcd28"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.10.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "80088aca8de835e301e6846f748a14179528d0424f28b330fd6d9c1d57b32869"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.10.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dc2723c334669aca613cd804f686d1fcec05e9737d9835fa7ea31a4b9e0aed7e"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.10.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e3afcfc4a9604e1f34da63f8f90fca7e97820b894b81815a3c0b20c9939b410c"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
