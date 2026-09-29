cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.15.0"
  sha256 arm:   "59c588266a34aad10e44dbbb1ec3bbf3109d12f2e28fb12316fc50587fa28c0d",
         intel: "be6461f20d9e061a9416263f0453507ffb37ef074da0f7107b62dd93e0a5b4be"

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
