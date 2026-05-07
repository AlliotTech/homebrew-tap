cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.3.0"
  sha256 arm:   "0fb3b372d1cbd77579f9cc19784ba86c050bf14973beabec4ecd984a225c495b",
         intel: "a6cb447f8db0442726a5615d9b96048eb782dd179b127a277c6368af4d825063"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
