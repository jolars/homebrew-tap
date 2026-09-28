class Badness < Formula
  desc "Language server, formatter, and linter for LaTeX"
  homepage "https://badness.dev"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.25.0/badness-aarch64-apple-darwin.tar.gz"
      sha256 "361c86ffd6efcfb4bacd3bf33baa213dc3ffa6889e80a7de36ee259a49bd7ad1"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.25.0/badness-x86_64-apple-darwin.tar.gz"
      sha256 "676f78f7ee5bab7577d4799d228b16fda660c5dc9e8396ae7e3209c7a992eba4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/badness/releases/download/v0.25.0/badness-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35047632cf5f9c027830fd1b072d5d7f608c93a9cfe0f62e83624e69f2c0a66e"
    end
    on_intel do
      url "https://github.com/jolars/badness/releases/download/v0.25.0/badness-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec5b31f6e4745ecbbf6b7d78d3db7b501a238c74134e8c7faccf806b15faa270"
    end
  end

  def install
    bin.install "badness"
    # Man pages and completions ship in the tarball from the first release built
    # with the bundling packages.yml; guard so the formula also installs cleanly
    # against older releases that carried only the binary.
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/badness.bash" if File.exist?("completions/badness.bash")
    fish_completion.install "completions/badness.fish" if File.exist?("completions/badness.fish")
    zsh_completion.install "completions/_badness" if File.exist?("completions/_badness")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/badness --version")
  end
end
