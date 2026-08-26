cask "apaste" do
  arch arm: "arm64", intel: "x86_64"
  version "0.9.0"
  sha256 arm:   "40a7f5f8a4fb43503a6bc425fe2c1b08c72a8f0b13d8e5b1d3245eb68bc72bc3",
         intel: "a2605dc1e9ed906ef7f5007e29cc1d6e8213e8c3e919d30fdb5341aaa25214db"

  url "https://github.com/AlliotTech/aPaste/releases/download/v#{version}/aPaste-v#{version}-#{arch}.dmg"
  name "aPaste"
  desc "SwiftUI-native paste manager"
  homepage "https://github.com/AlliotTech/aPaste"

  app "aPaste.app"
end
