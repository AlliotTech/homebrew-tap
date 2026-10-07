cask "uutmux" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "e8fbce9b4fa1f8699880c66c3fd4e437dad1db5471a32ce6948b5d93f1ad2f0c",
         intel: "e4e154c6f998518a6e2fe8ccd8d36200f17f532f22fcdd8bd46ad9fbdc5c2a70"

  url "https://github.com/AlliotTech/uu-tmux/releases/download/v#{version}/UUTmux-v#{version}-#{arch}.dmg"
  name "UUTmux"
  desc "Menu bar manager for NetEase UU remote terminal sessions"
  homepage "https://github.com/AlliotTech/uu-tmux"

  depends_on macos: :sonoma

  app "UUTmux.app"

  zap trash: "~/Library/Application Support/uu-tmux"
end
