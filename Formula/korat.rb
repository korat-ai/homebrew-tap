class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://github.com/korat-ai/korat-mcp-hub"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/korat-mcp-hub/releases/download/v0.1.0/korat-cli-darwin-arm64.tar.gz"
      sha256 "d0b65fa94831b553c878c64fac2734f0c277b0d4bfed7db4e2f1dead2902d9a9"
    end
    on_intel do
      url "https://github.com/korat-ai/korat-mcp-hub/releases/download/v0.1.0/korat-cli-darwin-x64.tar.gz"
      sha256 "90ba2b7e9dde9817f2e6f920e42f544e6b128c1689e66fcb761268697e7ec8e0"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
