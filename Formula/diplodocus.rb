class Diplodocus < Formula
  desc "Documentation websites for polyglot software projects"
  homepage "https://diplodocus.cc"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.12.0/diplodocus-aarch64-apple-darwin.tar.xz"
      sha256 "cd4393e165d783be039014bffbae71f386f9ef874c732f547c7736f80f727b19"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.12.0/diplodocus-x86_64-apple-darwin.tar.xz"
      sha256 "cd74f4c5e0c526942d2155d155be8bb9facfb2de8cff037691ae6591b947fdf1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/diplodocus/releases/download/v0.12.0/diplodocus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7f2bfdeddd3ab08bb1de14e208b9f684bf680e08ccd9bc3783cf08ef61fbcee5"
    end
    on_intel do
      url "https://github.com/jolars/diplodocus/releases/download/v0.12.0/diplodocus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c0fa931bc957aa00424fa8193cfa8c1eea189dd1949a3ef977f46fe64ab448fe"
    end
  end

  def install
    bin.install "diplodocus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diplodocus --version")
  end
end
