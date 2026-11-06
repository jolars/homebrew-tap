class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.12.1/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "c5648d6fa44506d8d41da8a06dd70bae69ea45976af2120ad49677bd5b39205d"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.12.1/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "9ff28ebc9da3081468931cab57826e1f0d3002fedfd42e96e7ef020b8ead20e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.12.1/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b72262fc4002b02136fe5893c3d5da182311da43788b3e019adcfb23600317da"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.12.1/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6f536ed6e416c3f482c4e98e7fbfbae3ae962c1452646a0864260d830462c0d0"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
