class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.0/korat-cli-v0.2.0-darwin-arm64.tar.gz"
      sha256 "1cb09171c08d96fddba4dd0fd630b82eb757a525dcff92e61ca0007b7e5dba63"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.0/korat-cli-v0.2.0-darwin-x64.tar.gz"
      sha256 "49b002f61ecbed8deff75650ea4ad479f2b25e4c15801d85049a475c4ffda017"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.0/korat-cli-v0.2.0-linux-arm64.tar.gz"
      sha256 "f50a14150bfb60300a11e141b2be167bed4dc61a41d98903d26ccf390b5bd3be"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.2.0/korat-cli-v0.2.0-linux-x64.tar.gz"
      sha256 "a15af4d6b40acd228d5841f245b4ac1058864d6045fbdd51d651ce71942dcead"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
