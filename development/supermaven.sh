#!/usr/bin/env bash

# This script is used to update the supermaven extension manifest to run on IntelliJ 2025

# Get current script directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

DIR=$DIR

# Check if the "supermaven-1.43.zip" file exists
if [ ! -f "$DIR/supermaven-1.43.zip" ]; then
  echo "The 'supermaven-1.43.zip' file does not exist in the current directory."
  echo "Please download the 'supermaven-1.43.zip' file from the IntelliJ IDEA extensions page and place it in the current directory."
  echo "Extension path: https://plugins.jetbrains.com/plugin/23893-supermaven/versions/stable"
  exit 1
fi

echo "Updating the supermaven extension manifest to run on IntelliJ 2025..."

# Create a temporary directory
TMP_DIR=$(mktemp -d)

# Extract the "supermaven-1.43.zip" file to the temporary directory
unzip -q "$DIR/supermaven-1.43.zip" -d "$TMP_DIR"

# Unzip the "instrumented-supermaven-1.43.jar" file from the temporary directory
unzip -q "$TMP_DIR/supermaven/lib/instrumented-supermaven-1.43.jar" -d "$TMP_DIR/supermaven/lib/instrumented-supermaven-1.43"

# Edit the until-build="243.*" attribute in the "plugin.xml" file to match the latest "251.*" version
# sed -i 's/until-build="251.*"/until-build="252.*"/g' "$TMP_DIR/supermaven/lib/instrumented-supermaven-1.43/META-INF/plugin.xml"
if sed --version >/dev/null 2>&1; then
  # GNU sed (Linux)
  sed -i 's/until-build="251.*"/until-build="252.*"/g' \
    "$TMP_DIR/supermaven/lib/instrumented-supermaven-1.43/META-INF/plugin.xml"
else
  # BSD sed (macOS)
  sed -i '' 's/until-build="251.*"/until-build="252.*"/g' \
    "$TMP_DIR/supermaven/lib/instrumented-supermaven-1.43/META-INF/plugin.xml"
fi

# Update the jar file with the new "plugin.xml" file
(cd "$TMP_DIR/supermaven/lib/instrumented-supermaven-1.43" && zip -qr "$TMP_DIR/supermaven/lib/instrumented-supermaven-1.43.jar" .)

# Remove the "lib/instrumented-supermaven-1.43" directory from the temporary directory
rm -rf "$TMP_DIR/supermaven/lib/instrumented-supermaven-1.43"

# Create a new "supermaven.zip" file from the temporary directory by creating the supermaven directory in the root of the zip file
(cd "$TMP_DIR" && zip -qr "$TMP_DIR/supermaven.zip" .)

# Replace the "supermaven-1.43.zip" file with the compressed "supermaven.zip" file
mv "$TMP_DIR/supermaven.zip" "$DIR/supermaven-1.43-updated.zip"

# Cleanup the temporary directory
rm -rf "$TMP_DIR"

echo "Done!"
