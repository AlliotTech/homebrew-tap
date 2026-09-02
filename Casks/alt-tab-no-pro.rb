cask "alt-tab-no-pro" do
  version "11.5.0"
  sha256 "3b803f08159e7fa987dcfb308854d28bfd32fbf2a54b8d3265aabe4739166468"

  url "https://github.com/AlliotTech/alt-tab-macos/releases/download/v#{version}/AltTab-no-pro-#{version}.zip",
      verified: "github.com/AlliotTech/alt-tab-macos/"
  name "AltTab no-pro"
  desc "No-pro local build of AltTab"
  homepage "https://github.com/AlliotTech/alt-tab-macos"

  conflicts_with cask: "alt-tab"
  depends_on :macos

  app "AltTab.app"

  uninstall quit: "com.lwouis.alt-tab-macos"
end
