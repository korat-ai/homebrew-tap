class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.5/korat-cli-v0.2.5-darwin-arm64.tar.gz"
      sha256 "6ce7534c156b7ddb11b207a8d29f08bdebc3dcf498c61da27246225dda2b99e1"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.5/korat-cli-v0.2.5-darwin-x64.tar.gz"
      sha256 "f67da3dbde122030cd28630508a0a618ed99ba83fd3c6265171c06b3f01a197d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.5/korat-cli-v0.2.5-linux-arm64.tar.gz"
      sha256 "a1984ff0e7484f7857e77724edba201a12bf79ba04faac22239483a96a372c0b"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.5/korat-cli-v0.2.5-linux-x64.tar.gz"
      sha256 "534485680188383be9831255c873a8c525853ee78daa532b8782b8c48db5af95"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
