class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.15.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "1d85ccf010509655b939ad181f09716e23e367238d828f769516b141a2259f61"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.15.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "4abaa2f9e528d0e699cdad7e4b068691a4566446905f8d4c56a5863f426cf091"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.15.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f2b8e39a1ef3592d8f54540db7ecb0f442da5194e954f7c1abb6c807dc9b7baa"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.15.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "08c15048953ec2f1c00bdd370dfac8910ab93f8480cc9030cfb2690fb6af16bb"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
