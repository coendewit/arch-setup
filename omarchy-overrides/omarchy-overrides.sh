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
omarchy-webapp-install "VGT Board" https://dev.azure.com/databalk/Debatic/_boards/board/t/1.1%20Vastgoedtabel/Backlog%20items?System.AssignedTo=%40me https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/azure-devops.png

## Add ~/bin to env in uwsm
if ! grep -q 'PATH="~/bin:\$PATH"' ~/.config/uwsm/env; then
    echo "PATH=\"~/bin:\$PATH\"" >> ~/.config/uwsm/env
fi
