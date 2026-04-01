cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.7"
  sha256 arm:   "88d26732257d547aa7dd4017c7091c4f071fb6f3962b310efba0e76d87c72a65",
       intel: "4f987fcf9830ec86487e91705006b4cbe823d0948ce4da9bb685f4297c5befc1"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
