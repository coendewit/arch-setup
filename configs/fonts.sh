#!/bin/bash

echo "=== Install and configure JetBrains Mono ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

mkdir -p ~/.local/share/fonts

if [[ ! -f ~/.local/share/fonts/JetBrainsMono-Regular.ttf ]]; then
  cp -f "$SCRIPT_DIR/fonts/*.ttf" ~/.local/share/fonts
fi

fc-cache -fv

create-symlink "$SCRIPT_DIR/fonts/fonts.config" ~/.config/fontconfig/fonts.conf
