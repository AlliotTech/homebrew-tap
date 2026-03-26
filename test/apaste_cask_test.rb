# typed: false
# frozen_string_literal: true

source = File.read(File.expand_path("../Casks/apaste.rb", __dir__))

unless source.match?(/arch\s+arm:\s*"arm64",\s*intel:\s*"x86_64"/)
  raise 'expected arch mapping `arm: "arm64", intel: "x86_64"` in cask source'
end

unless source.match?(%r{url\s+"https://github\.com/AlliotTech/aPaste/releases/download/v#\{version\}/aPaste-v#\{version\}-#\{arch\}\.dmg"})
  raise 'expected arch-specific release URL in cask source'
end

unless source.match?(/sha256\s+arm:\s+"[a-f0-9]{64}",\s*\n\s*intel:\s+"[a-f0-9]+"/)
  raise "expected per-architecture sha256 values in cask source"
end

unless source.match?(/app\s+"aPaste\.app"/)
  raise 'expected aPaste.app artifact in cask source'
end
