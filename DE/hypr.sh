#!/bin/bash

echo "=== Install and configure Hyprland ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found uwsm
install_if_not_found libnewt
install_if_not_found hyprland
install_if_not_found hyprshot
install_if_not_found hyprpicker
install_if_not_found hyprlock
install_if_not_found hypridle
install_if_not_found hyprsunset
install_if_not_found polkit-gnome
install_if_not_found hyprland-qtutils
install_if_not_found walker-bin
install_if_not_found libqalculate
install_if_not_found waybar
install_if_not_found mako
install_if_not_found swaybg
install_if_not_found swayosd
install_if_not_found xdg-desktop-portal-hyprland
install_if_not_found xdg-desktop-portal-gtk

create_symlink "$SCRIPT_DIR/hypr/hyprland.conf" ~/.config/hypr/hyprland.conf
