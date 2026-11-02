cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.12.0"
  sha256 arm:   "202d1f4eb8e1febbb08a85c4a4ec6c2c3e8147b559f020359be4381060ab414b",
         intel: "dd9dcca55cde62ef01b65f61b9fe7d01ae7bacbf75d06f0b97f9a4da7e206fc1"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  depends_on macos: :sequoia

  app "aPaste.app"
end
