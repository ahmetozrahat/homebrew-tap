# Confible — Homebrew tap

```bash
brew install --cask ahmetozrahat/tap/confible
```

That is the whole tap. One cask, macOS only.

## What it installs

The **same `.dmg`** the [releases page](https://github.com/ahmetozrahat/confible-releases/releases)
serves, at the same SHA-256 — Apple-notarized and signed as
`Developer ID Application: Ahmet Özrahat (GF446FQ39J)`. Nothing is rebuilt here,
and this repository holds no binaries: the cask is a URL and a checksum.

Confible keeps its own updater, which reads `latest-mac.yml` from the releases
repository. A `brew` install and a `.dmg` install are therefore the same
application on the same update path — which is why the cask declares
`auto_updates true` and `brew upgrade` leaves the app to update itself.

## What it does not cover

Windows and Linux. `winget` needs a signed installer and the Windows build is
not signed yet; the AUR entry is not written. Both are tracked on the release
repository as
[#1](https://github.com/ahmetozrahat/confible-releases/issues/1) and
[#2](https://github.com/ahmetozrahat/confible-releases/issues/2).

## Removing it

```bash
brew uninstall --cask confible          # the app
brew uninstall --zap --cask confible    # the app, its settings and its cache
```

`--zap` deletes the connection library and the local vault. The passwords
themselves are in the login keychain under `Confible Safe Storage`, and no
uninstaller touches the keychain — remove that item by hand in Keychain Access
if you want it gone.

## Everything else

Source is private. Downloads, bug reports and the public roadmap are at
[ahmetozrahat/confible-releases](https://github.com/ahmetozrahat/confible-releases),
and the product is at [confible.dev](https://confible.dev/).
