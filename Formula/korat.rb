class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.6/korat-cli-v0.2.6-darwin-arm64.tar.gz"
      sha256 "3f46941652aad0094ee6fc644603db15a1894ef7f5911d45a6adfa16ba6d622a"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.6/korat-cli-v0.2.6-darwin-x64.tar.gz"
      sha256 "a0fec76cc61cd923f0e4abed1ded0bb228a52cdaa555c3a4fa791fe372b44101"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.6/korat-cli-v0.2.6-linux-arm64.tar.gz"
      sha256 "ab109b7d1d1b5a2e2fe6804b7b958c4b32787345999b314fdd067d1fead5dad1"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.6/korat-cli-v0.2.6-linux-x64.tar.gz"
      sha256 "2c8901d423f64c3a2fc9f7c66481bf54cc0ba3ddf7758a13f252b6a0b355c037"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
