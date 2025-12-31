#!/bin/bash

echo "=== Install and configure SSH keys ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found openssh
install_if_not_found libfido2

mkdir -p ~/.ssh
create_symlink "$SCRIPT_DIR/ssh/config" ~/.ssh/config

eval "$(ssh-agent -s)" >/dev/null

cd ~/.ssh

echo "=== Insert your primary SSH key ==="
read -r
ssh-keygen -K
mv id_ed25519_sk_rk id_ed25519_sk_primary
mv id_ed25519_sk_rk.pub id_ed25519_sk_primary.pub

echo "=== Insert your backup SSH key ==="
read -r
ssh-keygen -K
mv id_ed25519_sk_rk id_ed25519_sk_primary
mv id_ed25519_sk_rk.pub id_ed25519_sk_primary.pub

#ssh-add ~/.ssh/id_ed25519_sk_rk

cd "$SCRIPT_DIR"

git remote set-url origin git@github.com:coendewit/arch-setup.git
