#!/bin/bash

echo "=== Install and configure ZSH ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found zsh

# Change default shell for next login only
if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
  sudo -n usermod -s /usr/bin/zsh "$USER" || true
fi

# Install oh-my-zsh without spawning zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh-syntax-highlighting
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Install zsh-autosuggestions
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Install zsh-completions
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]]; then
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi

# Remove bash configuration
rm ~/.bash*

create_symlink "$SCRIPT_DIR/zsh/.zshrc" ~/.zshrc
create_symlink "$SCRIPT_DIR/zsh/my-theme" ~/.oh-my-zsh/custom/themes/my-arch-theme.zsh-theme
