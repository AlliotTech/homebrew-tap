cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.5"
  sha256 arm:   "d9ab1eadbf29cdce34ea4aafb4fdd349e9767c212ec2719a7187775e1e1cbb1c",
         intel: "9230eac0a99fd466788b1ba6fab02b71194c97c1936fb3eaf11a21d6c1ccb7a6"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
