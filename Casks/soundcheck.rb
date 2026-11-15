cask "soundcheck" do
  version "1.0"
  sha256 "0e060cd1c0c0c3916a1cfc9a16035dd74fbc4f3dc056094aafd03d57203d7d24"

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
