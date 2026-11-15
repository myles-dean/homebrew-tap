cask "enderpanel" do
  version :latest
  sha256 :no_check

  url "https://github.com/myles-dean/enderpanel-releases/releases/latest/download/EnderPanel-Mac.dmg"
  name "EnderPanel"
  desc "Run a free Minecraft server on your own computer"
  homepage "https://enderpanel.app/"

  # Always the newest release; EnderPanel updates itself after that.
  depends_on :macos

  app "EnderPanel.app"

  # Only the app's own settings. Servers and worlds live in ~/EnderPanel and
  # are never removed by uninstalling.
  zap trash: [
    "~/Library/Application Support/app.enderpanel.desktop",
    "~/Library/Caches/app.enderpanel.desktop",
    "~/Library/WebKit/app.enderpanel.desktop",
  ]
end
