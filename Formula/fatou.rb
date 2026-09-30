class Fatou < Formula
  desc "Language server, formatter, and linter for Julia"
  homepage "https://fatou.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.22.0/fatou-aarch64-apple-darwin.tar.gz"
      sha256 "f353496495264fdee6966956bb6bc8739b70eaba0e0df57130509ceaafd2d439"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.22.0/fatou-x86_64-apple-darwin.tar.gz"
      sha256 "4afba004be83ef673941c855b7f8c41785d64023e713318dc6e48a080f0beb2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/fatou/releases/download/v0.22.0/fatou-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f26d61e50d95cf0a1c1951b68cbec57a6828ebd89f32f2938cbdee2bc2d5dbc6"
    end
    on_intel do
      url "https://github.com/jolars/fatou/releases/download/v0.22.0/fatou-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20c698e251271d82b275c80ae39fe086964e9665d53d8e9308cde29ec105f18b"
    end
  end

  def install
    bin.install "fatou"
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/fatou.bash"
    fish_completion.install "completions/fatou.fish"
    zsh_completion.install "completions/_fatou"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fatou --version")
  end
end
