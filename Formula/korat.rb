class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.0/korat-cli-v0.3.0-darwin-arm64.tar.gz"
      sha256 "fe2ceb944037645f67b5b0d0eca34a5c7ffdb1d502900849310f9349f023e85f"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.0/korat-cli-v0.3.0-darwin-x64.tar.gz"
      sha256 "d85700e05681e236ce0817d5afcab33fd8f2a5c967a671b88a82770b506fe207"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.0/korat-cli-v0.3.0-linux-arm64.tar.gz"
      sha256 "d1873f4b92fdfc0c48695c502a95db16441ff65a46cf366924bbbebb50a74fcc"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.0/korat-cli-v0.3.0-linux-x64.tar.gz"
      sha256 "ff24f6a94837764c1212bcfb73a10d269e04fd030fe556023acef9b9c2645ac2"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
