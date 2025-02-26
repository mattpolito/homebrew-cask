cask "macupdater" do
  on_monterey :or_older do
    version "2.3.9"
    sha256 "786144fee33e8654e7d3e21763801aa008a492e75ea761f1b00dfdb1d4b5ee72"

    depends_on macos: ">= :mojave"
  end
  on_ventura :or_newer do
    version "3.1.2"
    sha256 "e99d0cffaa3daf41716ce2b22b0ca92665b9d598f8d62017deeaf1c2058fd3ca"

    depends_on macos: ">= :ventura"
  end

  url "https://www.corecode.io/downloads/macupdater_#{version}.dmg"
  name "MacUpdater"
  desc "Track and update to the latest versions of installed software"
  homepage "https://www.corecode.io/macupdater/index.html"

  livecheck do
    url "https://www.corecode.io/macupdater/macupdater#{version.major}.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true

  app "MacUpdater.app"
  binary "#{appdir}/MacUpdater.app/Contents/Resources/macupdater_client"

  uninstall quit:      "com.corecode.MacUpdater",
            launchctl: "com.corecode.MacUpdaterLaunchHelper"

  zap trash: [
    "~/Library/Application Scripts/com.corecode.MacUpdaterLaunchHelper",
    "~/Library/Application Support/MacUpdater",
    "~/Library/Application Support/MacUpdaterInstallHelper",
    "~/Library/Caches/com.corecode.MacUpdater",
    "~/Library/Containers/com.corecode.MacUpdaterLaunchHelper",
    "~/Library/Cookies/com.corecode.MacUpdater.binarycookies",
    "~/Library/Preferences/com.corecode.MacUpdater.plist",
  ]
end
