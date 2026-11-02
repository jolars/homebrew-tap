class Metewand < Formula
  desc "Reproducible computational benchmarks across languages"
  homepage "https://metewand.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.3.0/metewand-aarch64-apple-darwin.tar.xz"
      sha256 "73b5595c5c3e5ef7a09aa69826eb086b19cb80147f0a075289ce6ab5f7d34ef5"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.3.0/metewand-x86_64-apple-darwin.tar.xz"
      sha256 "007633e46cc8aa8fe5422e8936ffb3402e9e2d1a02a3fa4d36e3e416f3269580"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.3.0/metewand-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "600034d0eed988de0566f1e96eeb933d5737f0a8de0b8a1c38d9dde247f52110"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.3.0/metewand-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c52136c6da11218c980ebd87c19e76b8facab5d1cafc69dcdd26bc7e3c079bcd"
    end
  end

  def install
    bin.install "metewand"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/metewand --version")
    system bin/"metewand", "init", "benchmark"
    system bin/"metewand", "check", "--manifest", "benchmark/metewand.yaml"
  end
end
