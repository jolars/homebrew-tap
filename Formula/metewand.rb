class Metewand < Formula
  desc "Reproducible computational benchmarks across languages"
  homepage "https://metewand.org"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.8.0/metewand-aarch64-apple-darwin.tar.xz"
      sha256 "963c97f3052522579bc5d93456adb05a687c1fc0763daf77b4132b5e3f83e5d6"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.8.0/metewand-x86_64-apple-darwin.tar.xz"
      sha256 "db122121965f5247304b0c0ba4b43106232c15ecb4d1a9645f9fcbd16d115cf8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/metewand/releases/download/v0.8.0/metewand-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dbad0232a2954afc008f1b5bb2de6d533f58d794d2d689368c8327bd5b62d891"
    end
    on_intel do
      url "https://github.com/jolars/metewand/releases/download/v0.8.0/metewand-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8832a720cb77705418d86cdf81e9981805c224968d8572e2fd0ce65ca1021032"
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
