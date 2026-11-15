cask "soundcheck" do
  version "1.0.1"
  sha256 "6ac05b81d6d361da59c2fdbe42ea65c5e6fd58834ade3fae63012ee2ed5798bf"

  url "https://github.com/myles-dean/Soundcheck/releases/download/v#{version}/Soundcheck.dmg"
  name "Soundcheck"
  desc "Per-app volume, several speakers, AirPlay and a mixing mic from the menu bar"
  homepage "https://github.com/myles-dean/Soundcheck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Soundcheck.app"

  # Quitting gives every app its own sound back and makes the real mic the Mac's input again.
  uninstall quit: "com.mylesdean.Soundcheck"

  # Soundcheck Mic is a Core Audio driver the app installs when asked; Core Audio has to restart
  # to let go of it. Kept to zap so upgrades don't remove it.
  zap script: {
        executable: "/bin/sh",
        args:       [
          "-c",
          "if [ -d /Library/Audio/Plug-Ins/HAL/SoundcheckMic.driver ]; then " \
          "rm -rf /Library/Audio/Plug-Ins/HAL/SoundcheckMic.driver && killall coreaudiod; fi",
        ],
        sudo:       true,
      },
      trash:  "~/Library/Preferences/com.mylesdean.Soundcheck.plist"
end
