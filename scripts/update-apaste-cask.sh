#!/bin/sh

set -eu

OWNER="${OWNER:-AlliotTech}"
REPO="${REPO:-aPaste}"
API_VERSION="${GITHUB_API_VERSION:-2026-03-10}"
RELEASE_API_URL="${GITHUB_RELEASE_API_URL:-https://api.github.com/repos/${OWNER}/${REPO}/releases/latest}"
CASK_PATH="${CASK_PATH:-Casks/apaste.rb}"

for command in curl ruby; do
  if ! command -v "${command}" >/dev/null 2>&1; then
    echo "missing required command: ${command}" >&2
    exit 1
  fi
done

release_json="$(mktemp)"
trap 'rm -f "${release_json}"' EXIT INT TERM HUP

curl \
  --fail \
  --silent \
  --show-error \
  --location \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: ${API_VERSION}" \
  "${RELEASE_API_URL}" \
  -o "${release_json}"

parsed_release="$(
  ruby -rjson -e '
    data = JSON.parse(File.read(ARGV[0]))
    tag = data.fetch("tag_name")
    version = tag.sub(/\Av/, "")

    expected_assets = {
      "arm" => "aPaste-v#{version}-arm64.dmg",
      "intel" => "aPaste-v#{version}-x86_64.dmg",
    }

    shas = expected_assets.transform_values do |asset_name|
      asset = data.fetch("assets").find { |item| item["name"] == asset_name }
      abort("missing asset: #{asset_name}") unless asset

      digest = asset["digest"]
      abort("missing digest for asset: #{asset_name}") unless digest.is_a?(String)
      abort("unexpected digest format for asset: #{asset_name}") unless digest.start_with?("sha256:")

      digest.delete_prefix("sha256:")
    end

    puts [version, shas.fetch("arm"), shas.fetch("intel")].join("\t")
  ' "${release_json}"
)"

version="$(printf '%s' "${parsed_release}" | ruby -e 'parts = STDIN.read.split("\t", 3); puts parts.fetch(0)')"
arm_sha="$(printf '%s' "${parsed_release}" | ruby -e 'parts = STDIN.read.split("\t", 3); puts parts.fetch(1)')"
intel_sha="$(printf '%s' "${parsed_release}" | ruby -e 'parts = STDIN.read.split("\t", 3); puts parts.fetch(2)')"

ruby - "${CASK_PATH}" "${version}" "${arm_sha}" "${intel_sha}" <<'RUBY'
path, version, arm_sha, intel_sha = ARGV

source = File.read(path)

unless source.sub!(/version\s+"[^"]+"/, %(version "#{version}"))
  abort("failed to update version in #{path}")
end

sha_block = <<~SHA.chomp
  sha256 arm:   "#{arm_sha}",
         intel: "#{intel_sha}"
SHA

unless source.sub!(/sha256\s+arm:\s+"[a-f0-9]{64}",\s*\n\s*intel:\s+"[a-f0-9]{64}"/, sha_block)
  abort("failed to update sha256 block in #{path}")
end

File.write(path, source)
RUBY

printf 'Updated %s to version %s\n' "${CASK_PATH}" "${version}"
