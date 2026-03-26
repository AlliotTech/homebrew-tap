cask "apaste" do
  version "0.0.1"
  sha256 "df78a9bc272969d20851055d2835be729e8e12beec05f3a41138d4ac534fae88"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
