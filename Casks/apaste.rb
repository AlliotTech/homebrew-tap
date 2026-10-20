cask "apaste" do
  arch arm: "arm64", intel: "x86_64"

  version "0.11.0"
  sha256 arm:   "f4029341f61ac03979cf72153f9e3000df03b411a97ec4f59e3d9682b650efe4",
         intel: "a06b17c969f3ae1502f352b58a79b393f4d60415eb6b08d595416d6659db1ebe"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  depends_on macos: :sequoia

  app "aPaste.app"
end
