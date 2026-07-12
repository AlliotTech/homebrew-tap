cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.8.0"
  sha256 arm:   "805f6a53883f987c3efb50cbd0952b609696ca0630ea17e4c1b4034eb35733c6",
         intel: "34afe9a8c8f05424449a766c05f61987ef1b4d534e22c4e8f97fe30d8270c2c2"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
