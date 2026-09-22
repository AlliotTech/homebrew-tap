cask "uutmux" do
  arch arm: "arm64", intel: "x86_64"
  version "0.1.0"
  sha256 arm:   "a9af33caf8607a5325fa6d33bc3cad3ab1405ab3f8646748f3f3e72fefa58caa",
         intel: "202acd019ba654b59c5295bfd2d3f3fcc374a1aa64f1d180ccf3876f2e81e92a"

  url "https://github.com/AlliotTech/uu-tmux/releases/download/v#{version}/UUTmux-v#{version}-#{arch}.dmg"
  name "UUTmux"
  desc "Menu bar manager for NetEase UU remote terminal sessions"
  homepage "https://github.com/AlliotTech/uu-tmux"

  app "UUTmux.app"

  zap trash: [
    "~/Library/Application Support/uu-tmux",
  ]
end
