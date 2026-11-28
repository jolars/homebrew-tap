class Metewand < Formula
  desc "Reproducible computational benchmarks across languages"
  homepage "https://metewand.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.11.0/metewand-aarch64-apple-darwin.tar.xz"
      sha256 "8062151c2c8f18470bc3bbedac02bad082853b14f16f06acdb475fe6912bff93"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.11.0/metewand-x86_64-apple-darwin.tar.xz"
      sha256 "51635311cfee19a9c20cd4c54e22ef65b95eebae26fa795124d6669d9e62e10c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.11.0/metewand-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6fe5ca6ed1ad9184a5f7a9d93ecef559fc8a4b15ca4ee2e9ba2fc13c31528135"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.11.0/metewand-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "019bfed467114d1c2eb45cded3c74dfecc4df8c703d2671878c9d63b513cbeae"
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
