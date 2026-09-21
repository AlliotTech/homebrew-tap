cask "alt-tab-no-pro" do
  version "11.7.1"
  sha256 "cf15b8b7a86b759df84c73b5e99d3eb412b645ec677f284e8b35747f39ad7ff1"

  url "https://github.com/AlliotTech/alt-tab-macos/releases/download/v#{version}/AltTab-no-pro-#{version}.zip"
  name "AltTab no-pro"
  desc "No-pro local build of AltTab"
  homepage "https://github.com/AlliotTech/alt-tab-macos"

  conflicts_with cask: "alt-tab"
  depends_on :macos

  app "AltTab.app"

  uninstall quit: "com.lwouis.alt-tab-macos"
end
