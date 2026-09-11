cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.8.1"
  sha256 arm:   "d5733a93ba73020f86605f0f1146dbcbd2e611b652c08c9112dcd60ab8a14a88",
         intel: "3ddaf90941036932215fb8deee67417a11680f6e97f684667bcebbc65f31a7c3"

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
