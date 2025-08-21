#!/bin/bash

echo "=== Install and configure Jetbrains Toolbox ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

install_if_not_found fuse
install_if_not_found glib2
install_if_not_found libxslt
install_if_not_found libxss
install_if_not_found xcb-util-keysyms
install_if_not_found xdg-utils
install_if_not_found nss

cd "$SCRIPT_DIR"/jetbrains
makepkg -si
