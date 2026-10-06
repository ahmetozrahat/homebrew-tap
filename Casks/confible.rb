cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.19.0"
  sha256 arm:   "de45aaa652795aad64ae9f74f191f68afb2edbeda18be646be8b39e1c6d0cade",
         intel: "27529ee23ef5d46677d753cdf5b3a7eb06bb6a991f3d9bdb60c3b8a04b5a045b"

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
