# ----------------------------
# Sway overrides
# ----------------------------
echo "=== Sway overrides ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

source "$SCRIPT_DIR/../helper_functions.sh"

create_symlink "$SCRIPT_DIR/sway/bindings.conf" "$HOME/.config/sway/config.d/bindings.conf"
create_symlink "$SCRIPT_DIR/sway/keyboard.conf" "$HOME/.config/sway/config.d/keyboard.conf"
create_symlink "$SCRIPT_DIR/sway/monitor.conf" "$HOME/.config/sway/config.d/monitor.conf"
create_symlink "$SCRIPT_DIR/sway/terminal.conf" "$HOME/.config/sway/config.d/terminal.conf"
