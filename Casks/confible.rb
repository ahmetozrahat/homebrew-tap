cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.2.1"
  sha256 arm:   "b029c9b5fd542f775faebf310683bc9a64278cf01680d6d343afb76ebb2b272c",
         intel: "3ad2ea4ab783bc450c055271e9b9a8e5f0c07c38cf77d694b8e41a998d27e3f7"

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
