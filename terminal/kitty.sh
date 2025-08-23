#!/bin/bash

echo "=== Install and configure Kitty ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found kitty

create_symlink "$SCRIPT_DIR/kitty/kitty.conf" ~/.config/kitty/kitty.conf
