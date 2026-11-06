cask "joymouse" do
  version "1.0.0"
  sha256 "40671f2119ea4cdf714e16f4dcd203beaff9a71786d5ef58088aa68bf2d9ca39"

  url "https://github.com/myles-dean/joymouse/releases/download/v#{version}/JoyMouse-#{version}.zip"
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
