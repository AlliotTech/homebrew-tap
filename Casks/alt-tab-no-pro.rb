cask "alt-tab-no-pro" do
  version "11.3.0"
  sha256 "b3bf84232b23fdf22e2c381bbb82d261190bc3fcca5624d4c1a5ff0e7d9596f5"

  url "https://github.com/AlliotTech/alt-tab-macos/releases/download/v#{version}/AltTab-no-pro-#{version}.zip",
      verified: "github.com/AlliotTech/alt-tab-macos/"
  name "AltTab no-pro"
  desc "No-pro local build of AltTab"
  homepage "https://github.com/AlliotTech/alt-tab-macos"

  conflicts_with cask: "alt-tab"
  depends_on macos: :high_sierra

  app "AltTab.app"

  uninstall quit: "com.lwouis.alt-tab-macos"
end
