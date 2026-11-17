class Metewand < Formula
  desc "Reproducible computational benchmarks across languages"
  homepage "https://metewand.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.7.0/metewand-aarch64-apple-darwin.tar.xz"
      sha256 "aad4ea020f0e32d5cae5d6a84287aab55737e384b4a18510c51a919476764b58"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.7.0/metewand-x86_64-apple-darwin.tar.xz"
      sha256 "3e7666c3236dd26ad28b120b0e456173d0068437d1144408cd8f0ca937138963"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.7.0/metewand-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0226d3d30f3d9b50e6e0ecb522b7f3e2a2672c414f5a169a4f95ae1c19ad8b95"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.7.0/metewand-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c2623ad392ae8142cada8a8f55b00b030913f0fd4b785b6982de1b08b03f2a2f"
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
