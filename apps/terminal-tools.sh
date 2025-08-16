#!/bin/bash

echo "=== Install terminal tools ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found ripgrep
install_if_not_found bat
install_if_not_found unzip
install_if_not_found fastfetch
install_if_not_found wget
install_if_not_found curl
install_if_not_found inetutils
install_if_not_found jq
install_if_not_found fd
install_if_not_found eza
install_if_not_found fzf
install_if_not_found bat
install_if_not_found wl-clipboard
install_if_not_found btop
install_if_not_found tldr
install_if_not_found less
install_if_not_found whois
