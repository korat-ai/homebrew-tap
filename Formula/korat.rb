class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.3/korat-cli-v0.4.3-darwin-arm64.tar.gz"
      sha256 "8fac7d0fcbef30d983e2a743792549d682b63402bee9f55a5ecdd11482448eb5"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.3/korat-cli-v0.4.3-darwin-x64.tar.gz"
      sha256 "dd851e33823d0a87acba31277ff918b75eb7e6f34c7762baa565d370a2a0576a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.3/korat-cli-v0.4.3-linux-arm64.tar.gz"
      sha256 "5a9472c5f699244529e41eec2eadd4cafaf093786e13dc0ce7fce6bff518e00b"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.3/korat-cli-v0.4.3-linux-x64.tar.gz"
      sha256 "83be81e9c1ba4bbb864e9e1ccd84867b3cc46db618c4b8ca59a3422eac4ef697"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
