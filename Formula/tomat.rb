class Tomat < Formula
  desc "Cross-platform Pomodoro timer with daemon support"
  homepage "https://jolars.github.io/tomat"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jolars/tomat/releases/download/v2.16.0/tomat-aarch64-apple-darwin.tar.gz"
      sha256 "90edc621fa215d5c986c483c58da4d5b99e0204cccb42671406a90d1242d588c"
    end
    on_intel do
      url "https://github.com/jolars/tomat/releases/download/v2.16.0/tomat-x86_64-apple-darwin.tar.gz"
      sha256 "1b010d0738c3a081605804e96e8bce6e226168248b9cf8d3513d7e2fe68d8758"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/tomat/releases/download/v2.16.0/tomat-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78d5038087676e648dcb0d386bde9e6ec53e762c901d6605ce7b536c6a50df9c"
    end
    on_intel do
      url "https://github.com/jolars/tomat/releases/download/v2.16.0/tomat-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb007d9c3e0e567279407fd1ad2434022e938298b16f25a9f7938003740d2152"
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
