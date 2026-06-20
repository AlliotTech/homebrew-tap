cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.7.0"
  sha256 arm:   "98ba72fb0b5875bfef22ac08ec08e72122f9f736fbc497bb018218f298958475",
         intel: "e5f2228e6e251ca4439cb88b1196f94ae08d32bb8f87692d3b9813ba5218897e"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
