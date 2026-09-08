class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.23.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "570402cafea79188b7e741484f8881adad6340fbb3410d4de72454ea0dd8176f"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.23.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "d2257afc01b994ede57dcb8c07876f1350a7681cb42175c479d92fa82536378a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.23.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d88c1807e260c7e89f8f75242eec455d513f2762f5071b6d0fc1fb0abc46ad29"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.23.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c47f083d1953357a6bc248971a40dae049cb7359b0a8d6080a0c31c37ac7f6a6"
    end
  end

  def install
    bin.install "arity"
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/arity.bash"
    fish_completion.install "completions/arity.fish"
    zsh_completion.install "completions/_arity"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arity --version")
  end
end
