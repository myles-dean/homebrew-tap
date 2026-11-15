cask "soundcheck" do
  version "1.1"
  sha256 "24b787dbfb9081b322a50a9fc6c698eafa4ecd10125269bbfba1aaccf35db379"

  url "https://github.com/myles-dean/Soundcheck/releases/download/v#{version}/Soundcheck.dmg"
  name "Soundcheck"
  desc "Per-app volume, several speakers, AirPlay and a mixing mic from the menu bar"
  homepage "https://github.com/myles-dean/Soundcheck"

  livecheck do
    url :url
    strategy :github_latest
  end

  # It updates itself (Sparkle) from 1.1 on.
  auto_updates true
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
