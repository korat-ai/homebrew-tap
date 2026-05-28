class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://github.com/korat-ai/korat-mcp-hub"
  version "0.0.0-stub"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/korat-mcp-hub/releases/download/STUB/korat-cli-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/korat-ai/korat-mcp-hub/releases/download/STUB/korat-cli-darwin-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    odie "This is a placeholder Formula. The tap is not yet announced. " \
         "Wait for the first real release before installing."
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
