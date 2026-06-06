class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.2.8"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.8/korat-cli-v0.2.8-darwin-arm64.tar.gz"
      sha256 "6fedd42fbb9139e5a3f73818cceadf2199c88e0a42bb56865c37ac144f915cbc"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.8/korat-cli-v0.2.8-darwin-x64.tar.gz"
      sha256 "a35d3cc97e6b17a0b4719cbe07eaf4997e56059814ddd781ec8d4095cc0d3244"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.8/korat-cli-v0.2.8-linux-arm64.tar.gz"
      sha256 "b649c0fe73b580cabb90220b7db202506e96703a10f95881ebda71b049971ec2"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.8/korat-cli-v0.2.8-linux-x64.tar.gz"
      sha256 "e644c554df541155d284fc93f9351468dc55819feb5aa3712be8295b904dc629"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
