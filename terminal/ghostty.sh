#!/bin/bash

echo "=== Install and configure Ghostty ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

git clone https://github.com/sahaj-b/ghostty-cursor-shaders ~/.config/ghostty/shaders

create_symlink "$SCRIPT_DIR/ghostty/config" ~/.config/ghostty/config
