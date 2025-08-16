# ----------------------------
# Configure rofi
# ----------------------------
echo "=== Configure rofi ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

cp -r "$SCRIPT_DIR/rofi" ~/.config/rofi
