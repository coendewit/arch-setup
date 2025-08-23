#!/bin/bash

echo "=== Personal overrides for Omarchy ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

create_symlink "$SCRIPT_DIR/bindings.conf" ~/.config/hypr/bindings.conf
create_symlink "$SCRIPT_DIR/monitors.conf" ~/.config/hypr/monitors.conf
create_symlink "$SCRIPT_DIR/input.conf" ~/.config/hypr/input.conf
create_symlink "$SCRIPT_DIR/../desktop/monitors-desktop.conf" ~/.config/hypr/monitors-desktop.conf
create_symlink "$SCRIPT_DIR/../desktop/monitors-laptop.conf" ~/.config/hypr/monitors-laptop.conf
