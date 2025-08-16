#!/bin/bash

echo "=== Neovim installation and configuration ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found neovim
install_if_not_found lazygit

if [[ ! -f ~/.config/nvim/lazyvim.json ]]; then
  rm -rf ~/.config/nvim
  git clone https://github.com/LazyVim/starter ~/.config/nvim

  rm -rf ~/.config/nvim/.git
fi

create_symlink "$SCRIPT_DIR/neovim/keymaps.lua" ~/.config/nvim/lua/config/keymaps.lua
create_symlink "$SCRIPT_DIR/neovim/supermaven.lua" ~/.config/nvim/lua/plugins/supermaven.lua
