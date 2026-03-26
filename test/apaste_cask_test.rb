# typed: false
# frozen_string_literal: true

cask = Cask::CaskLoader.load("alliottech/tap/apaste")

expected_url = "https://github.com/AlliotTech/aPaste/releases/download/v#{cask.version}/aPaste-v#{cask.version}.dmg"
actual_url = cask.url&.to_s

raise "expected url #{expected_url.inspect}, got #{actual_url.inspect}" if actual_url != expected_url

sha256 = cask.sha256&.to_s

raise "expected a 64-character sha256, got #{sha256.inspect}" unless sha256&.match?(/\A[a-f0-9]{64}\z/)
