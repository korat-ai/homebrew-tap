class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.1/korat-cli-v0.2.1-darwin-arm64.tar.gz"
      sha256 "936de47ca2ba177a0ca3ad0fbdb990ac6ac8c704f1de996485d97e9a3e8f3799"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.1/korat-cli-v0.2.1-darwin-x64.tar.gz"
      sha256 "093468010b61c4f664a8b03da74b510467b95d95afa5efadc89a4055b2779dff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.1/korat-cli-v0.2.1-linux-arm64.tar.gz"
      sha256 "288841f2a80323046541cc37ec28d9033ff0bd3c15c8f713582478c02495e3f7"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.1/korat-cli-v0.2.1-linux-x64.tar.gz"
      sha256 "820a22477a0c9722728dd20b08bd79213743dd8fcdce6af3c08a52177c5e6278"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
