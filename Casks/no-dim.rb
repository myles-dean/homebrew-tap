cask "no-dim" do
  version "1.0"
  sha256 "5410be4ce0eb05ee95cccb59f9f65e86bc38af99b2dc9b2f85c0d4f726da866e"

  url "https://github.com/myles-dean/NoDim/releases/download/v#{version}/NoDim.dmg"
  name "No Dim"
  desc "Keep the screen on, switched from Control Center"
  homepage "https://github.com/myles-dean/NoDim"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "No Dim.app"

  uninstall quit: "com.mylesdean.NoDim"

  zap trash: [
    "~/Library/Containers/com.mylesdean.NoDim",
    "~/Library/Containers/com.mylesdean.NoDim.Controls",
    "~/Library/Group Containers/3N7MVP4K42.com.mylesdean.NoDim",
  ]
end
