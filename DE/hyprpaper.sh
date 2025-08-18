#!/bin/bash

echo "=== Install and configure Hyprpaper ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found hyprpaper

create_symlink "$SCRIPT_DIR/hyprpaper/hyprpaper.conf" ~/.config/hyprpaper/hyprpaper.conf

create_symlink "$SCRIPT_DIR/hyprpaper/osaka-jade-bg.jpg" ~/.config/hyprpaper/backgrounds/osaka-jade-bg.jpg
create_symlink "$SCRIPT_DIR/hyprpaper/osaka-jade-bg-2.jpg" ~/.config/hyprpaper/backgrounds/osaka-jade-bg-2.jpg
create_symlink "$SCRIPT_DIR/hyprpaper/osaka-jade-bg-3.jpg" ~/.config/hyprpaper/backgrounds/osaka-jade-bg-3.jpg
