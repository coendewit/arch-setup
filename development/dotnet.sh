#!/bin/bash

echo "=== Install and configure .net ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

export DOTNET_ROOT="$HOME/.dotnet"

mkdir -p "$DOTNET_ROOT"

ARCH="linux-x64"
RELEASE_INDEX="https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/releases-index.json"

echo "Fetching release index..."
curl -fsSL "$RELEASE_INDEX" -o releases-index.json

# Download the first (usually the newest/most recent channel, e.g., .NET 10.0)
curl -L -o releases-1.json "$(jq -r '.["releases-index"][0]."releases.json"' releases-index.json)"

# Download the second
curl -L -o releases-2.json "$(jq -r '.["releases-index"][1]."releases.json"' releases-index.json)"

# Extract latest
read -r NAME URL HASH < <(
  jq -r '
    .releases[0]
    | .sdk.files[]
    | select(.rid == "'"$ARCH"'" and (.name | endswith(".tar.gz")))
    | [.name, .url, .hash]
    | @tsv
  ' releases-1.json
)

echo "Latest sdk: $NAME"
echo "Downloading from $URL ..."

curl -fL -o "$NAME" "$URL"

echo "Validating SHA512 checksum..."
echo "$HASH  $NAME" | sha512sum -c -

echo "Extracting to $DOTNET_ROOT ..."
mkdir -p "$DOTNET_ROOT"
tar zxf "$NAME" -C "$DOTNET_ROOT" --strip-components=1  # Strips the top-level version folder

rm "$NAME"

# Extract latest -1
read -r NAME URL HASH < <(
  jq -r '
    .releases[0]
    | .sdk.files[]
    | select(.rid == "'"$ARCH"'" and (.name | endswith(".tar.gz")))
    | [.name, .url, .hash]
    | @tsv
  ' releases-2.json
)

echo "Latest sdk: $NAME"
echo "Downloading from $URL ..."

curl -fL -o "$NAME" "$URL"

echo "Validating SHA512 checksum..."
echo "$HASH  $NAME" | sha512sum -c -

echo "Extracting to $DOTNET_ROOT ..."
mkdir -p "$DOTNET_ROOT"
tar zxf "$NAME" -C "$DOTNET_ROOT" --strip-components=1  # Strips the top-level version folder

rm "$NAME"

