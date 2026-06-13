class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.3/korat-cli-v0.3.3-darwin-arm64.tar.gz"
      sha256 "32814d34ddcad1f5a39ca532f38f9aa2e3b676045b6fbc7ff56ca7b6653e4b9e"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.3/korat-cli-v0.3.3-darwin-x64.tar.gz"
      sha256 "4fd6bf46b4f71ceafedf6594fc470fbde9b51f14ca812dc3d247a0cd0fe1430f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.3/korat-cli-v0.3.3-linux-arm64.tar.gz"
      sha256 "26dbb0218a2cf4080bf4ad22a0ad2a07335a29df21cc18d5a63977c9d902f73d"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.3.3/korat-cli-v0.3.3-linux-x64.tar.gz"
      sha256 "bcb6c0e301289f0867a32b7c695cf72a09e40c0d58ae382d16a39d86867ac1c4"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
