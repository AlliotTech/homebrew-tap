# frozen_string_literal: true

# Rewrite a dual-architecture cask's version + sha256 block in place.
# Usage: ruby rewrite_dual_arch.rb <cask_path> <version> <arm_sha> <intel_sha>

path, version, arm_sha, intel_sha = ARGV

source = File.read(path)

version_sha_block = [
  %Q(  version "#{version}"),
  %Q(  sha256 arm:   "#{arm_sha}",),
  %Q(         intel: "#{intel_sha}"),
].join("\n")

pattern = /
  ^\s*version\s+"[^"]+"\s*\n
  \s*sha256\s+arm:\s+"[a-f0-9]{64}",\s*\n
  \s*intel:\s+"[a-f0-9]{64}"
/x

match_count = 0

source.gsub!(pattern) do
  match_count += 1
  (match_count == 1) ? version_sha_block : ""
end

abort("failed to update version and sha256 block in #{path}") if match_count.zero?

File.write(path, source)
