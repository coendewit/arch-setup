#!/bin/bash

echo "=== Install and configure Waybar ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found waybar

create_symlink "$SCRIPT_DIR/waybar/style.css" ~/.config/waybar/style.css
create_symlink "$SCRIPT_DIR/waybar/config.jsonc" ~/.config/waybar/config.jsonc
