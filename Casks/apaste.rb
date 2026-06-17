cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.4.0"
  sha256 arm:   "be68fc4bf95b386e720aef0dd69c0b7c51fe2f0f8db0c421103a9ff807dbdbc0",
         intel: "389e0382c9d0f6ca252a061a2ac8b7df7b00da6292db1102eb17b3fb2908de45"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
