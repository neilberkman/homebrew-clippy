cask "draggy" do
  version "0.9.0"
  sha256 "60bc08dc0f8e557ca39d4708d3c3f5677c21ee3a87e160c37d54846e385272e8"

  url "https://github.com/neilberkman/clippy/releases/download/v#{version}/Draggy.app.zip"
  name "Draggy"
  desc "Minimal menu bar app that makes clipboard files draggable"
  homepage "https://github.com/neilberkman/clippy"

  livecheck do
    url :url
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  app "Draggy.app"

  zap trash: [
    "~/Library/Preferences/com.clippy.draggy.plist",
  ]
end