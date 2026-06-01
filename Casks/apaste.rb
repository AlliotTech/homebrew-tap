cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.3.1"
  sha256 arm:   "92a679651bdf0d33b3cba2e6c526120c8597633f6226ba649ddc963b7bfd1847",
         intel: "63ef6303f0efeef60733ddc1c2dcc00e76b224de1245e6efeb109c0cd1d48c15"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
