#!/bin/bash

echo "=== Install and configure JetBrains Mono ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

mkdir -p /usr/share/fonts/TTF

if [[ ! -f /usr/share/fonts/TTF/JetBrainsMono-Regular.ttf ]]; then
  cp -f "$SCRIPT_DIR/JetBrainsFonts/" /usr/share/fonts/TTF/
fi
