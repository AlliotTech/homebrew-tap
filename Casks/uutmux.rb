cask "uutmux" do
  arch arm: "arm64", intel: "x86_64"
  version "0.1.0"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/AlliotTech/uu-tmux/releases/download/v#{version}/UUTmux-v#{version}-#{arch}.dmg"
  name "UUTmux"
  desc "Menu bar manager for NetEase UU remote terminal sessions"
  homepage "https://github.com/AlliotTech/uu-tmux"

  app "UUTmux.app"

  zap trash: [
    "~/Library/Application Support/uu-tmux",
  ]
end
