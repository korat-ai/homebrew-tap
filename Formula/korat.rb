class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://github.com/korat-ai/korat-mcp-hub"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/korat-mcp-hub/releases/download/v0.2.0/korat-cli-darwin-arm64.tar.gz"
      sha256 "1cb09171c08d96fddba4dd0fd630b82eb757a525dcff92e61ca0007b7e5dba63"
    end
    on_intel do
      url "https://github.com/korat-ai/korat-mcp-hub/releases/download/v0.2.0/korat-cli-darwin-x64.tar.gz"
      sha256 "49b002f61ecbed8deff75650ea4ad479f2b25e4c15801d85049a475c4ffda017"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
