cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.4"
  sha256 arm:   "b4662a2f1730049fdf742cf8e041b7d5e2e0738cd9d11a423da6cdcdc15e2d13",
         intel: "bc79295c6f8945d0d8e814248b60d8ec8880dec5f5dce6e73b1bcc39e5416c52"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
