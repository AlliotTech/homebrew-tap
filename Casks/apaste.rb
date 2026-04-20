cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.2.0"
  sha256 arm:   "dfe49fafe4dbf47dedf4534d91589a11301687ba2423a836fbfa96019fa49ca7",
         intel: "ec46688df46db7dac048958e35641bf6fbf1e92fe2c5255955296d510929e06b"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
