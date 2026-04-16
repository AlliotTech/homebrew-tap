# typed: false
# frozen_string_literal: true

require "fileutils"
require "tmpdir"

root = File.expand_path("..", __dir__)
source = File.read(File.expand_path("../Casks/apaste.rb", __dir__))

unless source.match?(/arch\s+arm:\s*"arm64",\s*intel:\s*"x86_64"/)
  raise 'expected arch mapping `arm: "arm64", intel: "x86_64"` in cask source'
end

unless source.match?(%r{url\s+"https://github\.com/AlliotTech/aPaste/releases/download/v#\{version\}/aPaste-v#\{version\}-#\{arch\}\.dmg"})
  raise "expected arch-specific release URL in cask source"
end

unless source.match?(/sha256\s+arm:\s+"[a-f0-9]{64}",\s*\n\s*intel:\s+"[a-f0-9]+"/)
  raise "expected per-architecture sha256 values in cask source"
end

raise "expected aPaste.app artifact in cask source" unless source.match?(/app\s+"aPaste\.app"/)

script_path = File.join(root, "scripts/update-apaste-cask.sh")

raise "expected update script at #{script_path}" unless File.exist?(script_path)

unless File.read(script_path).include?("/releases/latest")
  raise "expected update script to fetch the latest GitHub release"
end

Dir.mktmpdir("apaste-cask-test") do |dir|
  fixture_path = File.join(root, "test/fixtures/latest_release.json")
  cask_copy_path = File.join(dir, "apaste.rb")

  FileUtils.cp(File.join(root, "Casks/apaste.rb"), cask_copy_path)

  env = {
    "CASK_PATH"              => cask_copy_path,
    "GITHUB_RELEASE_API_URL" => "file://#{fixture_path}",
  }

  success = system(env, script_path, chdir: root)
  raise "expected update script to succeed" unless success

  updated_source = File.read(cask_copy_path)

  raise "expected script to update cask version from release tag" unless updated_source.match?(/version\s+"0\.0\.6"/)

  unless updated_source.match?(/sha256\s+arm:\s+"a{64}",\s*\n\s*intel:\s+"b{64}"/)
    raise "expected script to update sha256 values from asset digests"
  end
end

Dir.mktmpdir("apaste-cask-duplicate-test") do |dir|
  fixture_path = File.join(root, "test/fixtures/latest_release.json")
  cask_copy_path = File.join(dir, "apaste.rb")

  File.write(cask_copy_path, <<~RUBY)
    cask "apaste" do
      arch arm: "arm64", intel: "x86_64"

      version "0.0.9"
      sha256 arm:   "#{"d" * 64}",
             intel: "#{"e" * 64}"
      version "0.1.0"
      sha256 arm:   "#{"f" * 64}",
             intel: "#{"1" * 64}"

      url "https://github.com/AlliotTech/aPaste/releases/download/v\#{version}/aPaste-v\#{version}-\#{arch}.dmg"
      name "aPaste"
    end
  RUBY

  env = {
    "CASK_PATH"              => cask_copy_path,
    "GITHUB_RELEASE_API_URL" => "file://#{fixture_path}",
  }

  success = system(env, script_path, chdir: root)
  raise "expected update script to clean duplicate version blocks" unless success

  updated_source = File.read(cask_copy_path)

  raise "expected exactly one version declaration after update" unless updated_source.scan(/version\s+"/).length == 1
  raise "expected exactly one sha256 declaration after update" unless updated_source.scan(/sha256\s+arm:/).length == 1
  raise "expected duplicate cleanup to keep latest release version" unless updated_source.match?(/version\s+"0\.0\.6"/)
end
