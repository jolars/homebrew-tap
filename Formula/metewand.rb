class Metewand < Formula
  desc "Reproducible computational benchmarks across languages"
  homepage "https://metewand.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.6.0/metewand-aarch64-apple-darwin.tar.xz"
      sha256 "1ae8f0c7cb53df593a99bad968ce6c0009e914ce6eb5333b6852fd1431ff1a31"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.6.0/metewand-x86_64-apple-darwin.tar.xz"
      sha256 "f237f14c612436e62f807b90ef3fb7ecf861c60ab24906882dedc39993523fd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.6.0/metewand-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7fd3ea8288c328dfb48238a455a03bb98ff875457cb80ee29106ad4bb23a0e38"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.6.0/metewand-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7b8fdb225feaabe0e37d9b8e9ae234ed00c4823753902363a107adb6abc9156d"
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
