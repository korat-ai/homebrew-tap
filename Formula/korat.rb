class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.0/korat-cli-v0.4.0-darwin-arm64.tar.gz"
      sha256 "e0ed49486dcd84c86a759e1dd36d2981f92506602cbbfd29a774f7f20b1dee6f"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.0/korat-cli-v0.4.0-darwin-x64.tar.gz"
      sha256 "12d47029fbf2cba1a4d17b5bcf4e979b6544ca019ed72695062c13e27751d91e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.0/korat-cli-v0.4.0-linux-arm64.tar.gz"
      sha256 "82d3f7aab1c763af140544d81be5e0363cad0cf2e9a9334f09ef5596f8aa81b4"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.0/korat-cli-v0.4.0-linux-x64.tar.gz"
      sha256 "88af1eb447c98c41882c18400354b4da3a9311d8534eed0acea0ae296f42dd0a"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
