cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.10.0"
  sha256 arm:   "4453e21e5761c479feae21a35d531c8b27fbe07111aaff0b64a8cee1e5d5c3cf",
         intel: "a59c1f41d51304c8b4ab86794eb3565e05d4b5fc9d924760bac2c28e2314ae1d"

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
