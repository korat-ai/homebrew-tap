class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.7/korat-cli-v0.2.7-darwin-arm64.tar.gz"
      sha256 "92fa8a017f13b370b85e498dc78d148b88117d2e9d9ac79d6b4507e0e169d150"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.7/korat-cli-v0.2.7-darwin-x64.tar.gz"
      sha256 "9335a1ab0f376f61eca045fb75b28901da0761a25dd42cfef7543fc622c73c9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.7/korat-cli-v0.2.7-linux-arm64.tar.gz"
      sha256 "47f1a04a0f3e4aa719b5b1b16158109ac25d52eb6786f6b8a1e3002024bf34ed"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.7/korat-cli-v0.2.7-linux-x64.tar.gz"
      sha256 "f34a0946a25a7d2f58639f5a740f04de9458d019eb2c6ceb9a94f9a2e6233729"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
