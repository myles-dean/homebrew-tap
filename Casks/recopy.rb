cask "recopy" do
  version "1.0"
  sha256 "d7dbb00dad4d6e225a886c537e0eefb2e5ea6c072875f2960022ebf56838de9c"

  url "https://github.com/myles-dean/Recopy/releases/download/v#{version}/Recopy.dmg"
  name "Recopy"
  desc "Clipboard history with pins, snippets and a paste stack"
  homepage "https://github.com/myles-dean/Recopy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Recopy.app"

  # Quitting puts the paste stack's next item on the clipboard as an ordinary copy.
  uninstall quit: "com.mylesdean.Recopy"

  zap trash: [
    "~/Library/Application Support/Recopy",
    "~/Library/Caches/com.mylesdean.Recopy",
    "~/Library/Preferences/com.mylesdean.Recopy.plist",
  ]
end
