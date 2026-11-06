cask "joymouse" do
  version "1.0.0"
  sha256 "d02195c503728fef38e28b5f7af5a7896bda590ff74777eac5e0484479bd7af5"

  url "https://github.com/myles-dean/joymouse/releases/download/v#{version}/JoyMouse-#{version}.dmg"
  name "JoyMouse"
  desc "Use a Nintendo Switch 2 Joy-Con as a mouse"
  homepage "https://github.com/myles-dean/joymouse"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "JoyMouse.app"

  uninstall quit: "com.mylesdean.joymouse"

  zap trash: [
    "~/Library/Logs/JoyMouse.log",
    "~/Library/Preferences/com.mylesdean.joymouse.plist",
  ]
end
