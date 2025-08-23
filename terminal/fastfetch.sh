#!/bin/bash

echo "=== Install and configure Fastfetch ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found imagemagick
install_if_not_found fastfetch

create_symlink "$SCRIPT_DIR/fastfetch/config.jsonc" ~/.config/fastfetch/config.jsonc
create_symlink "$SCRIPT_DIR/fastfetch/logo/hyprland.icon" ~/.config/fastfetch/logo/hyprland.icon
