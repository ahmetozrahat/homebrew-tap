cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.11.1"
  sha256 arm:   "625fc5a8ce01eeeb15be4161cc0436f51c09eaa5eaab080727c906c5fc839a06",
         intel: "93560f6cffbea21c0962232e95e237e6e11d0093e53770f3c3ce435eb499bfad"

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
