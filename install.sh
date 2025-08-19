#!/bin/bash

set -e

echo "=== Arch Developer Bootstrap ==="

# ----------------------------
# Update system
# ----------------------------
echo "=== Update system ==="
sudo pacman -Syu --noconfirm

# ----------------------------
# Install desktop
# ----------------------------
for script in ./de/*.sh; do
  source "$script"
done

# ----------------------------
# Configuration files
# ----------------------------
for script in ./configs/*.sh; do
  source "$script"
done

# ----------------------------
# Install all apps
# ----------------------------
for script in ./apps/*.sh; do
  source "$script"
done

# ----------------------------
# Install bash scripts
# ----------------------------
source ./install_scripts.sh

# ----------------------------
# Finish
# ----------------------------
echo "=== Bootstrap complete! ==="
echo "Restart to apply changes"

read -p "Press enter to reboot"
reboot
