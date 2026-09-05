cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "dac410c4431eead9c3d57de17fec02e3c23b529f125ae2e49eef3c0cb0adbb09",
         intel: "45088ae60ed03e34ced71856e1f2a71973b3f5d5bbc9ac4d27e24a893818ed00"

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
