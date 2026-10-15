class Deixis < Formula
  desc "MCP server for interacting with language servers"
  homepage "https://github.com/jolars/deixis"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jolars/deixis/releases/download/v0.2.2/deixis-aarch64-apple-darwin.tar.xz"
      sha256 "b3977f83e88ed90f4cb02b3ad80a34e13ac91618c2dbf41501727954b5d96fe2"
    end
    on_intel do
      url "https://github.com/jolars/deixis/releases/download/v0.2.2/deixis-x86_64-apple-darwin.tar.xz"
      sha256 "6360311d86c5dbf125cd09927f8627c823478237a9873d748b82126b54e45c4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jolars/deixis/releases/download/v0.2.2/deixis-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "cbb135e1968da32ad27305aad1b30c4a5dfe6e0f16c221cd667cab138b86261a"
    end
    on_intel do
      url "https://github.com/jolars/deixis/releases/download/v0.2.2/deixis-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "807267d46e3a45b4cc7af7712f2df85b5c5a7a26001a40ecfed9f6006cd08f19"
    end
  end

  def install
    bin.install "deixis"
  end

  test do
    request = {
      jsonrpc: "2.0",
      id:      1,
      method:  "initialize",
      params:  {
        protocolVersion: "2025-11-25",
        capabilities:    {},
        clientInfo:      { name: "homebrew", version: "1.0.0" },
      },
    }

    Open3.popen3(bin/"deixis", "--root", testpath.to_s) do |stdin, stdout, _stderr, wait_thread|
      stdin.puts request.to_json
      response = JSON.parse(stdout.readline)
      assert_equal "deixis", response.dig("result", "serverInfo", "name")
      assert_equal version.to_s, response.dig("result", "serverInfo", "version")
      stdin.puts({ jsonrpc: "2.0", method: "notifications/initialized" }.to_json)
      stdin.close
      assert_predicate wait_thread.value, :success?
    end
  end
end
