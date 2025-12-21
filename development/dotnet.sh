#!/bin/bash

echo "=== Install and configure .net ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

DOTNET_FILE=dotnet-sdk-9.0.306-linux-x64.tar.gz
export DOTNET_ROOT="$HOME/.dotnet"

mkdir -p "$DOTNET_ROOT"

ARCH="linux-x64"
RELEASE_INDEX="https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/releases-index.json"

echo "Fetching release index..."
curl -fsSL "$RELEASE_INDEX" -o releases-index.json

# Select the latest supported (non-preview) channel
CHANNEL_URL=$(jq -r '
  .["releases-index"]
  | map(select(.["support-phase"] != "preview"))
  | sort_by(.["channel-version"] | split(".") | map(tonumber))
  | last
  | .["releases.json"]
' releases-index.json)

echo "Using channel:"
echo "  $CHANNEL_URL"

curl -fsSL "$CHANNEL_URL" -o releases.json

# Extract latest and previous SDK releases
jq -r --arg arch "$ARCH" '
  .releases
  | map(select(.sdk != null))
  | .[-2:]
  | .[]
  | .sdk.files[]
  | select(.rid == $arch and (.name | endswith(".tar.gz")))
  | [.name, .url, .hash]
  | @tsv
' releases.json | while IFS=$'\t' read -r NAME URL HASH; do
    echo
    echo "Downloading $NAME"
    curl -fL -o "$NAME" "$URL"

    echo "Validating checksum..."
    echo "$HASH  $NAME" | sha512sum -c -

    tar zxf "$NAME" -C "$DOTNET_ROOT"
done

echo
echo "Latest and previous .NET SDK versions downloaded and verified."
