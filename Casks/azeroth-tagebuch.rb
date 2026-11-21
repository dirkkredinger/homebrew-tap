cask "azeroth-tagebuch" do
  version "0.3.0"
  sha256 "38f8f23c6d732ae453f3d8da14729338dd12c0111f769abcd3f08886c6435cdc"

  url "https://github.com/dirkkredinger/azeroth-tagebuch/releases/download/v#{version}/Azeroth-Tagebuch_#{version}_universal.dmg"
  name "Azeroth-Tagebuch"
  desc "Adventure journal and statistics for World of Warcraft characters"
  homepage "https://github.com/dirkkredinger/azeroth-tagebuch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Azeroth-Tagebuch.app"

  zap trash: [
    "~/Library/Application Support/de.wowtagebuch.app",
    "~/Library/Caches/de.wowtagebuch.app",
    "~/Library/WebKit/de.wowtagebuch.app",
  ]

  caveats <<~EOS
    The app needs the addon in World of Warcraft as well:
    download AzerothTagebuch-Addon-#{version}.zip from
      https://github.com/dirkkredinger/azeroth-tagebuch/releases/latest
    and copy the AzerothTagebuch folder to _retail_/Interface/AddOns.
  EOS
end
