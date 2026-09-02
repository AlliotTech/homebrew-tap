#!/bin/sh

set -eu

OWNER="${OWNER:-AlliotTech}"
REPO="${REPO:-alt-tab-macos}"
API_VERSION="${GITHUB_API_VERSION:-2026-03-10}"
RELEASE_API_URL="${GITHUB_RELEASE_API_URL:-https://api.github.com/repos/${OWNER}/${REPO}/releases/latest}"
CASK_PATH="${CASK_PATH:-Casks/alt-tab-no-pro.rb}"

for command in curl ruby
do
  if ! command -v "${command}" >/dev/null 2>&1
  then
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

    expected_asset = "AltTab-no-pro-#{version}.zip"
    asset = data.fetch("assets").find { |item| item["name"] == expected_asset }
    abort("missing asset: #{expected_asset}") unless asset

    digest = asset["digest"]
    abort("missing digest for asset: #{expected_asset}") unless digest.is_a?(String)
    abort("unexpected digest format for asset: #{expected_asset}") unless digest.start_with?("sha256:")

    puts [version, digest.delete_prefix("sha256:")].join("\t")
  ' "${release_json}"
)"

version="$(printf '%s' "${parsed_release}" | ruby -e 'puts STDIN.read.split("\t", 2).fetch(0)')"
sha="$(printf '%s' "${parsed_release}" | ruby -e 'puts STDIN.read.split("\t", 2).fetch(1)')"

ruby - "${CASK_PATH}" "${version}" "${sha}" <<'RUBY'
path, version, sha = ARGV

source = File.read(path)

version_sha_block = [
  %(  version "#{version}"),
  %(  sha256 "#{sha}"),
].join("\n")

pattern = /
  ^\s*version\s+"[^"]+"\s*\n
  \s*sha256\s+"[a-f0-9]{64}"
/x

match_count = 0

source.gsub!(pattern) do
  match_count += 1
  match_count == 1 ? version_sha_block : ""
end

if match_count.zero?
  abort("failed to update version and sha256 block in #{path}")
end

File.write(path, source)
RUBY

printf 'Updated %s to version %s\n' "${CASK_PATH}" "${version}"
