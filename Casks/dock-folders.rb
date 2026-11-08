cask "dock-folders" do
  version "0.1"
  sha256 "1c1e6d370fae9cd529702222d2a2fb68e271a0ce67c3e8e4c735b8e5e1be5abc"

  url "https://github.com/myles-dean/DockFolders/releases/download/v#{version}/DockFolders.dmg"
  name "Dock Folders"
  desc "App folders for the Dock, like on iPhone"
  homepage "https://github.com/myles-dean/DockFolders"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Dock Folders.app"

  # The optional Dock helper (only installed when "Open apps only in their folders" is turned on).
  uninstall launchctl: "com.mylesdean.DockFolders.helper",
            quit:      "com.mylesdean.DockFolders",
            delete:    [
              "/Library/Application Support/Dock Folders/DockFoldersHook.dylib",
              "/Library/LaunchDaemons/com.mylesdean.DockFolders.helper.plist",
              "/Library/PrivilegedHelperTools/com.mylesdean.DockFolders.helper",
            ]

  zap trash: [
    "~/Library/Application Support/Dock Folders",
    "~/Library/Preferences/com.mylesdean.DockFolders.plist",
  ]
end
