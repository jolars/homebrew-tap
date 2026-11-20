class Metewand < Formula
  desc "Reproducible computational benchmarks across languages"
  homepage "https://metewand.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.9.0/metewand-aarch64-apple-darwin.tar.xz"
      sha256 "9416ecaa7b1495db96fc4b27c03957b98f5b3e5a3d7d8d28049bf2acf27c12f6"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.9.0/metewand-x86_64-apple-darwin.tar.xz"
      sha256 "6ad9f488c031e859051431e5f3a3621171a13e669519f791a038e09ae25d67b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.9.0/metewand-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "43de24163d12be3120992da9ebf9abe9370b68d30d31ec9a95eaf14dad56bfa2"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.9.0/metewand-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5d535f73b7629e8e8dde2ded43e2d5819cd1a42988f105e9639ccc04eeb35da2"
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
