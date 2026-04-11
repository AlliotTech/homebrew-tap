cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.9"
  sha256 arm:   "d03d87f2ec2af59be631d3935de66a4a7351a10c312838d7026c65294c849d31",
       intel: "8c208b7c5746d9ee3cce8fc9aeda9b833b6490d9d00cc694daa2832e6fd4ab9a"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
