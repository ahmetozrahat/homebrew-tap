cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.13.0"
  sha256 arm:   "c7601395d9a839a3f28c83f27cf25cd69c48178ba37a88ff2bf69bf38e0a08b5",
         intel: "4f41c7e50073f352ce61c6a4aacb40f4c6b1b930057834e586a8fcaaeab8b4c8"

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
