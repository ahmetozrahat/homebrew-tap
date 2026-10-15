cask "confible" do
  arch arm: "arm64", intel: "x64"

  version "1.20.0"
  sha256 arm:   "4a861666e3db1b9442dd3be9511bd392c4e41a302ba29ef89dcd36d5889cb938",
         intel: "7f9c64cfaadb1748dd0830df0dc944526667a31bc8536ea827c84b2481f90cfc"

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
