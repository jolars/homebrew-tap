class Tomat < Formula
  desc "Cross-platform Pomodoro timer with daemon support"
  homepage "https://jolars.github.io/tomat"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/tomat/releases/download/v2.14.0/tomat-aarch64-apple-darwin.tar.gz"
      sha256 "b715b28a94e21b367438582cfdd484087a67931d0e48be5f3d4d720dec2460a6"
    end
    on_intel do
      url "https://github.com/jolars/tomat/releases/download/v2.14.0/tomat-x86_64-apple-darwin.tar.gz"
      sha256 "f05904b3bd1ac709872825547dcb1620cdea66ff3cbfd8fff69057f4988aa5ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/tomat/releases/download/v2.14.0/tomat-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95c7fc858676f5bfab03799d055ce77e91794dc73396753b8eb3a22263a14101"
    end
    on_intel do
      url "https://github.com/jolars/tomat/releases/download/v2.14.0/tomat-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3407058d85c262d5337ae8433dfc381dd216b1d585cdba08b43a490b808e611"
    end

    depends_on "patchelf" => :build
    depends_on "alsa-lib"
  end

  def install
    if OS.linux?
      system "patchelf", "--set-rpath", formula_opt_lib("alsa-lib"), "tomat"
    end

    bin.install "tomat"
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/tomat.bash"
    fish_completion.install "completions/tomat.fish"
    zsh_completion.install "completions/_tomat"
  end

  service do
    run [opt_bin/"tomat", "--quiet", "daemon", "run"]
    environment_variables PATH: std_service_path_env
    error_log_path var/"log/tomat.log"

    if OS.mac?
      keep_alive successful_exit: false
      throttle_interval 5
    end

    if OS.linux?
      keep_alive true
      restart_delay 5
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tomat --version")
  end
end
