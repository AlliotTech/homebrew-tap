cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.6.0"
  sha256 arm:   "d7ef90a9d33f711d5f723c012792f63a9d25153fe40cd7edf472b6959b5e05b9",
         intel: "c1696b0b07e9292e423ea5609161daf832bb3b31f83bc36eb8a21291ba738eaf"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
