cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.18.0"
  sha256 arm:   "70555d7401c9964bf009aa921d104beb598ab782970a407e1b9ce0976f9cae2a",
         intel: "1eaed4c9ddd9e325cada04e598bb9c22cdc334eadb3a7cfbe604182078ff5fe1"

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
