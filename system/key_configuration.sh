#!/bin/bash

echo "=== Install and configure Keyboard ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found keyd

sudo systemctl enable --now keyd.service

sudo tee /etc/keyd/10-laptop-alt-super-swap.conf <<EOF
## copy id from sudo keyd monitor
## it is the part after device added: 
[ids]
0001:0001:70533846

[main]
leftalt = leftmeta
leftmeta = leftalt

alt+c = C-c
alt+v = C-v
alt+x = C-x
alt+a = C-a
EOF

sudo keyd reload
