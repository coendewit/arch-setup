#!/bin/bash

echo "=== Install and configure Kitty ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found zoxide
install_if_not_found fzf

if [[ -f ~/.zshrc ]]; then
  if ! grep -q 'eval "$(zoxide init zsh)"' ~/.zshrc; then
    echo "Adding zoxide to zshrc..."
    echo -e "\n# zoxide\neval \"\$(zoxide init zsh)\"" >>~/.zshrc
  fi
fi
