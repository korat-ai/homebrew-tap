class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.3/korat-cli-v0.2.3-darwin-arm64.tar.gz"
      sha256 "de918187db1800930b665bb91d1b7026977449a8e3d11e8e3b00a6a41d5e1dea"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.3/korat-cli-v0.2.3-darwin-x64.tar.gz"
      sha256 "0f52318813f06484d8cf21d3187fed4302ed51ff164478635e28958e272ad087"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.3/korat-cli-v0.2.3-linux-arm64.tar.gz"
      sha256 "b84c97630a863c1a5ccbe468ce9d81e4b94223c6b8414039b67d1f5135174438"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.3/korat-cli-v0.2.3-linux-x64.tar.gz"
      sha256 "522174c43acfbf3e7237138a09c98d94fa666acafedeb1f1778950c960a3505c"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
