cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.8"
  sha256 arm:   "2ed375f22a4984c0e4fb48023fdc5159de1f5b2d2fd63a94d6d6e989dd9795d5",
       intel: "8a065f900544f40330c62d62cc48ae87093446955e2fc3800e4f64853b08fa84"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
