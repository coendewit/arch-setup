#!/bin/bash

echo "=== Install and configure Jetbrains Toolbox ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found fuse
install_if_not_found glib2
install_if_not_found libxslt
install_if_not_found libxss
install_if_not_found xcb-util-keysyms
install_if_not_found xdg-utils
install_if_not_found nss

cd "$SCRIPT_DIR"/jetbrains
makepkg -siC

rm -rf "$SCRIPT_DIR"/jetbrains/jetbrains*.tar.gz
rm -rf "$SCRIPT_DIR"/jetbrains/jetbrains*.pkg.tar.zst

create_symlink "$SCRIPT_DIR"/jetbrains/.ideavimrc ~/.ideavimrc

# Use the wl toolkit

# Determinne the Rider version. It is the folder name within the jetbrains folder
RIDER_VERSION=$(basename ~/.config/JetBrains/Rider*)

if [ ! -f ~/.config/JetBrains/"$RIDER_VERSION"/rider64.vmoptions ]; then
  echo "No Rider vmoptions file found"
  exit 1
fi

# if setting is already there, do nothing
if grep -q "Dawt.toolkit.name=WLToolkit" ~/.config/JetBrains/"$RIDER_VERSION"/rider64.vmoptions; then
  echo "Dawt.toolkit.name=WLToolkit already set"
  exit 0
fi

tee ~/.config/JetBrains/Rider2025.2/rider64.vmoptions <<EOF
-Dawt.toolkit.name=WLToolkit
EOF
