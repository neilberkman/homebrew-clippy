cask "draggy" do
  version "1.1.0"
  sha256 "97dbef13b7c3db24c930677b67afd03d21bc2bbc3df8c81f22445b7ee335f929"

  url "https://github.com/neilberkman/clippy/releases/download/v#{version}/Draggy.app.zip"
  name "Draggy"
  desc "Minimal menu bar app that makes clipboard files draggable"
  homepage "https://github.com/neilberkman/clippy"

  livecheck do
    url :url
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  app "Draggy.app"

  # Remove quarantine attribute to bypass Gatekeeper
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Draggy.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.clippy.draggy.plist",
  ]
end