cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.14.0"
  sha256 arm:   "a6211272dd9f561c4372053826afcc12c5ba7df5fb992fc220225be6aecd3ae2",
         intel: "6ffa827f445dd7482c12c84a083a8fc29d8b5244c2a4b73f6a206a568f987dae"

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
