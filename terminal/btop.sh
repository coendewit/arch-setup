#!/bin/bash

echo "=== Install and configure Btop ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found btop

create_symlink "$SCRIPT_DIR/btop/btop.conf" ~/.config/btop/btop.conf
create_symlink "$SCRIPT_DIR/btop/themes/btop.conf" ~/.config/btop/themes/btop.conf
