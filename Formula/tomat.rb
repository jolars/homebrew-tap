class Tomat < Formula
  desc "Cross-platform Pomodoro timer with daemon support"
  homepage "https://jolars.github.io/tomat"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/tomat/releases/download/v2.13.0/tomat-aarch64-apple-darwin.tar.gz"
      sha256 "324f2597afc48bdaeb1c0e73bde1908abf0bc5e11763735cfe4c975aabff62a1"
    end
    on_intel do
      url "https://github.com/jolars/tomat/releases/download/v2.13.0/tomat-x86_64-apple-darwin.tar.gz"
      sha256 "103d9b454784d6e65f89d9e8d2fb2d800cc6cc421f9657a0ed616678b956651b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/tomat/releases/download/v2.13.0/tomat-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "780302df146fc76547d5f30798320dc257c0bfb2c991d13cbd7cc310946c5623"
    end
    on_intel do
      url "https://github.com/jolars/tomat/releases/download/v2.13.0/tomat-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d055adc3aef70c676fab1009b7231fb1edc32b14a99e7be31901cb22e73b86f"
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
