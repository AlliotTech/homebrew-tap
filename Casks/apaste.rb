cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.2.1"
  sha256 arm:   "a7b9f248684c458ce82ba958c1e7f3c5d83ccc674f5d2ac78bc93ef4d9cf00f7",
         intel: "e42567b1f82b392286be39b32774a6bb7ab08a418f170506f69c4a959f3d4db2"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
