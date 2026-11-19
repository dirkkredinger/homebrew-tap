cask "inputbattery" do
  version "1.0"
  sha256 "5fdc58e24b6b3363b670e56dbe8fbc2a9a9eab7872b3dd4285496dd575c90c8e"

  url "https://github.com/dirkkredinger/InputBattery/releases/download/v#{version}/InputBattery-#{version}.pkg"
  name "InputBattery"
  desc "Menu bar app and widget showing battery levels of Bluetooth keyboards, mice and AirPods"
  homepage "https://github.com/dirkkredinger/InputBattery"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  pkg "InputBattery-#{version}.pkg"

  uninstall quit:    "de.mbmf17.inputbattery",
            pkgutil: "de.mbmf17.inputbattery.pkg"

  zap trash: [
    "~/Library/Application Support/InputBattery",
    "~/Library/Containers/de.mbmf17.inputbattery.widget",
    "~/Library/Preferences/de.mbmf17.inputbattery.plist",
  ]
end
