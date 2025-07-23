cask "draggy" do
  version "0.13.0"
  sha256 "a724d02cfd967ed63f0824c80391cbae24c0833b433d1d613c1c1df2bf13e065"

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