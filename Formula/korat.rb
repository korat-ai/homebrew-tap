class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.1/korat-cli-v0.4.1-darwin-arm64.tar.gz"
      sha256 "a20744967d3423ef6c51d01e16d85e7a5c60b2e89a46c870c95c575ac4171c19"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.1/korat-cli-v0.4.1-darwin-x64.tar.gz"
      sha256 "a08ecc46370edbd3e390f7907e9e5024584f97f6cf8b5448402d88f5011830fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.1/korat-cli-v0.4.1-linux-arm64.tar.gz"
      sha256 "47ef90b598e2a4bf810cfba27d1fc496d839ec2d670eb81aa9c7703958dca78f"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.1/korat-cli-v0.4.1-linux-x64.tar.gz"
      sha256 "df1e7af243077fb35eae4183f2a99f9dc92a8eb11f34f8eca86448f55ebde596"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
