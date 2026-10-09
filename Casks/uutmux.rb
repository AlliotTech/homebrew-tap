cask "uutmux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.3"
  sha256 arm:   "79219f994dc61473df3bbededfd72dbc3871f3dec3bf213ef5e1a3bee6b06a06",
         intel: "5687d13680ccca9ac0b3f81d46e1b03f8a2aeea64c12ff9c63bc20fba37e4008"

  url "https://github.com/AlliotTech/uu-tmux/releases/download/v#{version}/UUTmux-v#{version}-#{arch}.dmg"
  name "UUTmux"
  desc "Menu bar manager for NetEase UU remote terminal sessions"
  homepage "https://github.com/AlliotTech/uu-tmux"

  depends_on macos: :sonoma

  app "UUTmux.app"

  zap trash: "~/Library/Application Support/uu-tmux"
end
