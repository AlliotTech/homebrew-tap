cask "aitranslator" do
  version "1.1"
  sha256 "d4ab1f5619b9ca16800a9dcabf4d8228f87791f3f0b4d8d23aff77bc60b7f541"

  url "https://github.com/AlliotTech/AITranslator/releases/download/v#{version}/AITranslator-#{version}.zip"
  name "AITranslator"
  desc "AI translation for macOS with screenshot OCR and streaming output"
  homepage "https://github.com/AlliotTech/AITranslator"

  # Apple Silicon only: the release binary is an arm64 build.
  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "AITranslator.app"

  zap trash: [
    "~/Library/Application Support/AITranslator",
    "~/Library/Preferences/Alliot.AITranslator.plist",
  ]
end
