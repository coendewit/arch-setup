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
for script in ./DE/*.sh; do
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
mkdir -p ~/bin
for script in ./bin/*.sh; do
  cp "$script" ~/bin/
  chmod +x ~/bin/$(basename "$script")
done

# add ~/bin to PATH if not already there
if ! grep -q '~/bin' <<<"$PATH"; then
  export PATH="$PATH:~/bin"
fi

# ----------------------------
# Finish
# ----------------------------
echo "=== Bootstrap complete! ==="
echo "Restart to apply changes"

read -p "Press enter to reboot"
reboot
