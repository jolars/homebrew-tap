class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.17.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "f15598ed867d8c497ae069f085e239dc37b39632aeb684f309fb4ede333033ed"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.17.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "b4f0623644601d3d9ddf73dcb3e3bbc315d4b107bfe5d5412523ea49da216fd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.17.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62bd19c93f06fb18932535323fb02130268828ed61f87d6aa231212573966eda"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.17.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "259d8596dffa46b347eb124ef539cc16393040ff093523ba39765aff7db26af6"
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
