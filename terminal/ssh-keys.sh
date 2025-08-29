#!/bin/bash

echo "=== Install and configure SSH keys ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found openssh

create_symlink "$SCRIPT_DIR/ssh/ssh_config" ~/.ssh/config

eval "$(ssh-agent -s)" >/dev/null

cd ~/.ssh
ssh-keygen -K
ssh-add ~/.ssh/id_ed25519_sk_rk
