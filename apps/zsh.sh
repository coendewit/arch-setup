#!/bin/bash

echo "=== Install and configure ZSH ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found zsh
install_if_not_found zsh-completions

# Change shell to zsh if SHELL variable is not /usr/bin/zsh
if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
  sudo usermod -s /usr/bin/zsh $USER
fi

# Install oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install zsh-syntax-highlighting
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Install zsh-autosuggestions
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Install zsh-history-substring-search
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
fi

# Remove bash configuration
rm ~/.bash*

create_symlink "$SCRIPT_DIR/zsh/.zshrc" ~/.zshrc
