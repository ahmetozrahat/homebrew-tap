cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.3.1"
  sha256 arm:   "7f07c729f15b78d935c2f5981caed27fecfdaaf9127d3cd451f86efa27cd4639",
         intel: "2de3def52a4784184f01761fd4747569f93dd540174e92ca6151899bddd8d6f1"

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
