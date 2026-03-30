cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.6"
  sha256 arm:   "4a00c5b9e1b2a2b3fde1e9a2099806f317e0878cd014b2271d27a4ac5666a8ae",
       intel: "99b9ea8a4c737c8bb237ee1f4c6348102398191d0c3eadbc4df4705003e20ae9"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
