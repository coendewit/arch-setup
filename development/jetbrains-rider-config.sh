#!/bin/bash

echo "=== Install and configure Jetbrains Rider ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

create_symlink "$SCRIPT_DIR"/jetbrains/.ideavimrc ~/.ideavimrc

# Use the wl toolkit - the following part won't work since JetBrains Rider is not installed yet
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

## TODO sym link keymap
