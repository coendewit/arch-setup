# ----------------------------
# Configure rofi
# ----------------------------
echo "=== Configure rofi ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found rofi

cp -r "$SCRIPT_DIR"/rofi ~/.config/rofi
