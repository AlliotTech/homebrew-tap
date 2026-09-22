# typed: false
# frozen_string_literal: true

require "fileutils"
require "tmpdir"

root = File.expand_path("..", __dir__)
source = File.read(File.expand_path("../Casks/uutmux.rb", __dir__))

unless source.match?(/arch\s+arm:\s*"arm64",\s*intel:\s*"x86_64"/)
  raise 'expected arch mapping `arm: "arm64", intel: "x86_64"` in cask source'
end

unless source.match?(%r{url\s+"https://github\.com/AlliotTech/uu-tmux/releases/download/v#\{version\}/UUTmux-v#\{version\}-#\{arch\}\.dmg"})
  raise "expected arch-specific release URL in cask source"
end

unless source.match?(/sha256\s+arm:\s+"[a-f0-9]{64}",\s*\n\s*intel:\s+"[a-f0-9]+"/)
  raise "expected per-architecture sha256 values in cask source"
end

raise "expected UUTmux.app artifact in cask source" unless source.match?(/app\s+"UUTmux\.app"/)

script_path = File.join(root, "scripts/update-uutmux-cask.sh")

raise "expected update script at #{script_path}" unless File.exist?(script_path)

unless File.read(script_path).include?("/releases/latest")
  raise "expected update script to fetch the latest GitHub release"
end

Dir.mktmpdir("uutmux-cask-test") do |dir|
  fixture_path = File.join(root, "test/fixtures/uutmux_latest_release.json")
  cask_copy_path = File.join(dir, "uutmux.rb")

  FileUtils.cp(File.join(root, "Casks/uutmux.rb"), cask_copy_path)

  env = {
    "CASK_PATH"              => cask_copy_path,
    "GITHUB_RELEASE_API_URL" => "file://#{fixture_path}",
    "RUBY"                   => RbConfig.ruby,
  }

  success = system(env, script_path, chdir: root)
  raise "expected update script to succeed" unless success

  updated_source = File.read(cask_copy_path)

  raise "expected script to update cask version from release tag" unless updated_source.match?(/version\s+"0\.0\.6"/)

  unless updated_source.match?(/sha256\s+arm:\s+"a{64}",\s*\n\s*intel:\s+"b{64}"/)
    raise "expected script to update sha256 values from asset digests"
  end
end
