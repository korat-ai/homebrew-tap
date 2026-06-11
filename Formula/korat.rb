class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.2/korat-cli-v0.3.2-darwin-arm64.tar.gz"
      sha256 "493d073179b05d98d6d119c3f5c8016f8eda879da51e3070297c1cc3e001cd1b"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.2/korat-cli-v0.3.2-darwin-x64.tar.gz"
      sha256 "658f38148467324367de240d1e43a03e4d95aece3ac060148d2e3ec2a6ff1fae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.2/korat-cli-v0.3.2-linux-arm64.tar.gz"
      sha256 "033dccb1bde5602878a99c5cf4e364eacdaa75d4905b34d7ee399ecb6d767ef4"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.2/korat-cli-v0.3.2-linux-x64.tar.gz"
      sha256 "1b8b5977e732d71ebf6067d9c6be0f6bbd61e0f77384d2788ef7a3577acb4c09"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
