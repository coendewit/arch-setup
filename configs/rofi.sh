# ----------------------------
# Configure rofi
# ----------------------------
echo "=== Configure rofi ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

install_if_not_found rofi-wayland

cp -r "$SCRIPT_DIR/wofi" ~/.config/rofi
