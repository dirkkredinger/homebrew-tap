cask "soundladder" do
  version "1.3"
  sha256 "32022a6c7bbc20693f03b1923470c043f015962f3a0aa3ca9ef4501437770bda"

  url "https://github.com/dirkkredinger/SoundLadder/releases/download/v#{version}/SoundLadder-#{version}.pkg"
  name "SoundLadder"
  desc "Menu bar app that picks the audio output from a ranked list"
  homepage "https://github.com/dirkkredinger/SoundLadder"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  pkg "SoundLadder-#{version}.pkg"

  uninstall quit:    "de.mbmf17.soundladder",
            pkgutil: "de.mbmf17.soundladder.pkg"

  zap trash: "~/Library/Preferences/de.mbmf17.soundladder.plist"
end
