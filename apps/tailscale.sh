#!/bin/bash

echo "=== Install and configure Tailscale ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

if ! command -v tailscale &>/dev/null; then
  curl -fsSL https://tailscale.com/install.sh | sh

  echo -e "\nStarting Tailscale..."
  sudo tailscale up --accept-routes
else
  echo -e "\nTailscale is already installed."
fi

create_webapp "Tailscale" "https://login.tailscale.com/admin/machines" https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/tailscale-light.png
