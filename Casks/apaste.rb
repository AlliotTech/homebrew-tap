cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.1.0"
  sha256 arm:   "f124f480ea7f3fb1988da693e8e3e2a52b3c1d3106db7264d32c8c0db3c6b6ce",
         intel: "844adee542985819ce0d9e92ab1a987d3652ce2be87cab6bf8bc9effc8cdd870"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
