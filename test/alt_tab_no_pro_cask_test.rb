# typed: false
# frozen_string_literal: true

source = File.read(File.expand_path("../Casks/alt-tab-no-pro.rb", __dir__))

raise "expected version 11.3.0" unless source.match?(/version\s+"11\.3\.0"/)
unless source.match?(%r{url\s+"https://github\.com/AlliotTech/alt-tab-macos/releases/download/v#\{version\}/AltTab-no-pro-#\{version\}\.zip"})
  raise "expected GitHub Release zip URL"
end
raise "expected sha256" unless source.match?(/sha256\s+"[a-f0-9]{64}"/)
raise "expected AltTab.app artifact" unless source.match?(/app\s+"AltTab\.app"/)
raise "expected official cask conflict" unless source.match?(/conflicts_with\s+cask:\s+"alt-tab"/)
