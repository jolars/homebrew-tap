class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.17.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "519bae6d9fbf252119c07a845acf38bb229594d071197170dc7736a56dbe558a"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.17.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "8db636d8c3b587c35519a4516153b3d31af6c60bfb30bbc4317c7b798f4e54bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.17.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b5c7adb863adcba45f2e926fc87a38c0d81fcd626834cba6730d468f7c249d9d"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.17.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bb531cbb0326d684e7727b70f633a73e1ebedf19a823ceab8435df9e58c13220"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
