class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.4/korat-cli-v0.2.4-darwin-arm64.tar.gz"
      sha256 "2ec803c9c615f7080d21cc896b0d146c6f8da99c26051cdcb9a5e43cc3bb3531"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.4/korat-cli-v0.2.4-darwin-x64.tar.gz"
      sha256 "84888009274c425d068301968f20408e44246aef6ac12f634147f88f4df8935d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.4/korat-cli-v0.2.4-linux-arm64.tar.gz"
      sha256 "00f5b0132127154245fd3d9faecf258349dbcd554ddf2be133fab7c0fc8f1659"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.4/korat-cli-v0.2.4-linux-x64.tar.gz"
      sha256 "aac98bdbaf56440be4f26d07b1b9b453c1a9e2f289eebfda16c212afd359ae10"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
