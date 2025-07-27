cask "draggy" do
  version "0.13.4"
  sha256 "84be725ae908f00941529ce1882f28307ad5dfb1bb6a18ebee0d23a957124e9b"

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