class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.4/korat-cli-v0.3.4-darwin-arm64.tar.gz"
      sha256 "e0e3f3bf887efc68d481b67a4ac7d125df60b8318f464d0af8dd16c7549f5ef1"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.4/korat-cli-v0.3.4-darwin-x64.tar.gz"
      sha256 "9aa104dd7aca78242352e2775b37535da8975f65167d878feb080d22e02631ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.4/korat-cli-v0.3.4-linux-arm64.tar.gz"
      sha256 "7d0a1419cff9d1fcc358da0010198014e9b0b1375d12b595be1c69c8ccb35994"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.4/korat-cli-v0.3.4-linux-x64.tar.gz"
      sha256 "f08916d3dc1847a16b1e5730e167442b231015b9ce1c8b1d4820dba98f237a72"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
