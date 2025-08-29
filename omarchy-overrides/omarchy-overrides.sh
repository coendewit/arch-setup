#!/bin/bash

echo "=== Personal overrides for Omarchy ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

create_symlink "$SCRIPT_DIR/bindings.conf" ~/.config/hypr/bindings.conf
create_symlink "$SCRIPT_DIR/monitors.conf" ~/.config/hypr/monitors.conf
create_symlink "$SCRIPT_DIR/input.conf" ~/.config/hypr/input.conf
create_symlink "$SCRIPT_DIR/../desktop/hypr/workspaces-desktop.conf" ~/.config/hypr/workspaces.conf

source "$SCRIPT_DIR/../terminal/kitty.sh"
source "$SCRIPT_DIR/../terminal/neovim.sh"
source "$SCRIPT_DIR/../terminal/jetbrains-toolbox.sh"

omarchy-webapp-install "Teams" http://teams.microsoft.com https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/microsoft-teams.png
