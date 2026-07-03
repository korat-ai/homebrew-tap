class Korat < Formula
  desc "Korat MCP Hub CLI — local-first MCP server access through a managed relay"
  homepage "https://get.korat.ai"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.2/korat-cli-v0.4.2-darwin-arm64.tar.gz"
      sha256 "97d974a1fa8bda3d53831fc017162fc234d7b0ded09564a26d4bf94e9c751218"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.2/korat-cli-v0.4.2-darwin-x64.tar.gz"
      sha256 "3832d46697fe5c1c91b542d6ad27570d2a8e8af291b5076278dd4e85f05799d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.2/korat-cli-v0.4.2-linux-arm64.tar.gz"
      sha256 "aa0b38fc33007de4925fe8e862a45462af3d35b32db774da8b35855eb3ff0c6c"
    end
    on_intel do
      url "https://github.com/korat-ai/homebrew-tap/releases/download/v0.4.2/korat-cli-v0.4.2-linux-x64.tar.gz"
      sha256 "8086c99f457d05b9f3edb494c263e9d2e8402cc6c8da7d1c9fe189d68fd1b469"
    end
  end

  def install
    bin.install "Korat.Cli" => "korat"
  end

  test do
    assert_match "korat ", shell_output("#{bin}/korat version")
  end
end
