cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.10.0"
  sha256 arm:   "98317c90527cfdfb2938b042b1ddc0099e00a5ee5c2835b80519819ddaec5e84",
         intel: "216d9fe1d312b8edd80582917a4c792960cc0af97b128b0db260ce8efc6046ab"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  depends_on macos: :sequoia

  app "aPaste.app"
end
