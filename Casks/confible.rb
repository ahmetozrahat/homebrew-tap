cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.22.0"
  sha256 arm:   "336f68d3d805e25ebcfb7e093198cd2c5d4e9584f8d8120102122e078e4d5b00",
         intel: "f7bcd2ba3286595ba4461570a8fd071b4adb2341eb6ec30e04f01c891baadd69"

  url "https://github.com/ahmetozrahat/confible-releases/releases/download/v#{version}/confible-#{version}-#{arch}.dmg"
  name "Confible"
  desc "Connection manager for SSH, SFTP, FTP, SQL, S3, Redis and RDP"
  homepage "https://confible.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Confible.app"

  # Only the shipped app's profile. `Confible Dev (…)` directories belong to a
  # source checkout, not to anything this cask installed.
  zap trash: [
    "~/Library/Application Support/Confible",
    "~/Library/Caches/com.confible.app",
    "~/Library/Preferences/com.confible.app.plist",
    "~/Library/Saved Application State/com.confible.app.savedState",
  ]
end
