cask "draggy" do
  version "0.13.1"
  sha256 "2b9ad0e43d83077e862135c1affeaaf05503c69d447f3f2535932031623b3c50"

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