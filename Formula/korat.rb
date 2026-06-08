class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.1/korat-cli-v0.3.1-darwin-arm64.tar.gz"
      sha256 "aff5112fa7b83227c57bc0021083f36fa93eeaf3b825e8ac37069506e91eb265"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.1/korat-cli-v0.3.1-darwin-x64.tar.gz"
      sha256 "d6d91e8a33539f5465e350b8eeb14e4fd73efdd119cc5b1a0149ecfa4029f00a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.1/korat-cli-v0.3.1-linux-arm64.tar.gz"
      sha256 "e319188102729d645397bddc2a533c120a7088061807d10f3db54983903e8369"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.1/korat-cli-v0.3.1-linux-x64.tar.gz"
      sha256 "3b91e78ab190a72ee49df8147d1bd8b9c8ef91bc2cabf9f80137a698788a6786"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
