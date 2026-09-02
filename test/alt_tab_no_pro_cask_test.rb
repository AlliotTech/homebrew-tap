# typed: false
# frozen_string_literal: true

source = File.read(File.expand_path("../Casks/alt-tab-no-pro.rb", __dir__))

unless source.match?(%r{url\s+"https://github\.com/AlliotTech/alt-tab-macos/releases/download/v#\{version\}/AltTab-no-pro-#\{version\}\.zip"})
  raise "expected GitHub Release zip URL"
end
raise "expected sha256" unless source.match?(/sha256\s+"[a-f0-9]{64}"/)
raise "expected AltTab.app artifact" unless source.match?(/app\s+"AltTab\.app"/)
raise "expected official cask conflict" unless source.match?(/conflicts_with\s+cask:\s+"alt-tab"/)

script_path = File.expand_path("../scripts/update-alt-tab-cask.sh", __dir__)
raise "expected update script at #{script_path}" unless File.exist?(script_path)
unless File.read(script_path).include?("/releases/latest")
  raise "expected update script to fetch the latest GitHub release"
end

require "fileutils"
require "tmpdir"

fixture_path = File.expand_path("fixtures/alt_tab_latest_release.json", __dir__)

Dir.mktmpdir("alt-tab-cask-test") do |dir|
  cask_copy_path = File.join(dir, "alt-tab-no-pro.rb")
  FileUtils.cp(File.expand_path("../Casks/alt-tab-no-pro.rb", __dir__), cask_copy_path)

  env = {
    "CASK_PATH"              => cask_copy_path,
    "GITHUB_RELEASE_API_URL" => "file://#{fixture_path}",
  }

  success = system(env, script_path, chdir: File.expand_path("..", __dir__))
  raise "expected update script to succeed" unless success

  updated_source = File.read(cask_copy_path)

  raise "expected script to update cask version from release tag" unless updated_source.match?(/version\s+"0\.0\.6"/)
  raise "expected script to update sha256 from asset digest" unless updated_source.match?(/sha256\s+"a{64}"/)
end

Dir.mktmpdir("alt-tab-cask-duplicate-test") do |dir|
  cask_copy_path = File.join(dir, "alt-tab-no-pro.rb")

  File.write(cask_copy_path, <<~RUBY)
    cask "alt-tab-no-pro" do
      version "11.9.0"
      sha256 "#{"d" * 64}"
      version "11.10.0"
      sha256 "#{"f" * 64}"

      url "https://github.com/AlliotTech/alt-tab-macos/releases/download/v\#{version}/AltTab-no-pro-\#{version}.zip"
      name "AltTab no-pro"
    end
  RUBY

  env = {
    "CASK_PATH"              => cask_copy_path,
    "GITHUB_RELEASE_API_URL" => "file://#{fixture_path}",
  }

  success = system(env, script_path, chdir: File.expand_path("..", __dir__))
  raise "expected update script to clean duplicate version blocks" unless success

  updated_source = File.read(cask_copy_path)

  raise "expected exactly one version declaration after update" unless updated_source.scan(/version\s+"/).length == 1
  raise "expected exactly one sha256 declaration after update" unless updated_source.scan(/sha256\s+"/).length == 1
  raise "expected duplicate cleanup to keep latest release version" unless updated_source.match?(/version\s+"0\.0\.6"/)
end
