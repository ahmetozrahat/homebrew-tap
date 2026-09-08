cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.6.0"
  sha256 arm:   "b0c6a01af11edbfa67b1254fa8b24f14247eaec3cd86ceab3b9db3bcbd688eaa",
         intel: "bdfa411566cccc1485d1a8257d417542e33404104a0072b676df3d076cad8cb2"

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
