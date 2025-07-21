cask "draggy" do
  version "0.12.0"
  sha256 "525213ced684dccd225c26aac25c1ea55186d2f11b0607c466eb9478855df562"

  url "https://github.com/neilberkman/clippy/releases/download/draggy-v#{version}/Draggy.app.zip"
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