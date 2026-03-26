cask "apaste" do
  version "0.0.2"
  sha256 "c034573ecb9fe5dc0591323f8fcb982a9fcaab6bc0c6d9ec21d01991bdef0838"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
