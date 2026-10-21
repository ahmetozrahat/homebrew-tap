cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.21.0"
  sha256 arm:   "b9f88bbb813da9d2711852290f747c7a0993c00e1f7ff6844f32323ad1baf5cd",
         intel: "86da0fc9c2cdc48dc59248e296fc6f14a39a7c915cda60ae296335c8c388e21c"

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
