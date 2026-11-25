class Metewand < Formula
  desc "Reproducible computational benchmarks across languages"
  homepage "https://metewand.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.10.0/metewand-aarch64-apple-darwin.tar.xz"
      sha256 "08e716f7fbfa74788b4fc71bce47cb8ff0b91b9734c870d274f10917999ad440"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.10.0/metewand-x86_64-apple-darwin.tar.xz"
      sha256 "a2a55f35ee58358de18a7ec2ff75f41ba422b1aec7bfff0384fc04a4310d5bbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.10.0/metewand-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f5e9dd82acea093ec4825b0f2bf264c30d5126ce4673a9c15e649f313f51f05c"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.10.0/metewand-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ee07c2950c5be5e70cb657ff69996f5c4ad6692b5532cf6f2bcd7fcec0f1e464"
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
