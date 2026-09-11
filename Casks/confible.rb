cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.9.0"
  sha256 arm:   "665fcf7cb28568ac2c034ebd6c09dc7595e51c1d847ad28e26c327edf1713148",
         intel: "92b086278dc2550a9aada2c72e7ad7aeb3c1f4df235de095701e2a9bba56f688"

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
