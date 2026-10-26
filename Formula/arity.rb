class Arity < Formula
  desc "Language server, formatter, and linter for R"
  homepage "https://arity.cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.27.0/arity-aarch64-apple-darwin.tar.gz"
      sha256 "3373e448581c4fc388b15ab1673fe5cbd079749bab4a1211d26828c9312ddc72"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.27.0/arity-x86_64-apple-darwin.tar.gz"
      sha256 "835479df7c3ee816a4378607a8812016626b8bf48fe144fc7e7ba4d394224dbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/arity/releases/download/v0.27.0/arity-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59851cbb5ee298920a80a5919b215627900faab268b2597325e80ab78253246f"
    end
    on_intel do
      url "https://github.com/jolars/arity/releases/download/v0.27.0/arity-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76a262cfe49d50a4f419ee5dd7be205b15335e06d906a4a9d5934f9c039f5f54"
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
