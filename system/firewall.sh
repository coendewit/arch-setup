#!/bin/bash

echo "=== Install and configure UFW Firewall ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found ufw

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw enable
