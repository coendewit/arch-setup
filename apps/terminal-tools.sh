#!/bin/bash

echo "=== Install terminal tools ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found ripgrep
install_if_not_found bat
install_if_not_found unzip
install_if_not_found fastfetch
