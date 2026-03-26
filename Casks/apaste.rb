cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.3"
  sha256 arm:   "1b8f7524896fa4feba9ca376b7ec531088a2b59b98ebd1db1f2b2876ae446b15",
         intel: "12d2b6cf5396654f66433fce81cfc667cc9e55cb712703cda012b67387320b45"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
