cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.5.0"
  sha256 arm:   "4a32baaf4e2201fb24d101beed54bb211e8f41c84313a65d88cf223c06a29aff",
         intel: "9dcede0a9976a60f874c9057b2eaf33cc8123197fb55721c6614c0ae44b58b27"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
