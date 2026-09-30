cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.15.1"
  sha256 arm:   "0fb7b00d221109fbab9ac2f6ce19f8cb0378a686eac8ea218602db4858c08faa",
         intel: "7a3165dc31f7e803c10d69a3c77f2f83d493d4e316e2183276ca6490994bdcc4"

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
