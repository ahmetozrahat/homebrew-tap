cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.12.0"
  sha256 arm:   "0e844728d43a8f7b7537fd796f49911356cb226e290a1637ff8b21e4171b39da",
         intel: "19d18fc02f06e9bb51cb87e63a6ac41b4b32e1fe18bd256bd534f2315babc94c"

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
