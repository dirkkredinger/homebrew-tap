cask "azeroth-tagebuch" do
  version "0.5.0"
  sha256 "2da411b6900e2b73a1954f7dff2991444e0f3197cb17d9d8e9228c62c8de7792"

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
