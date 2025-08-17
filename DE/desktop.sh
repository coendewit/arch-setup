#!/bin/bash

sudo pacman -S --noconfirm \
  brightnessctl playerctl pamixer wiremix wireplumber \
  fcitx5 fcitx5-gtk fcitx5-qt wl-clip-persist \
  nautilus sushi ffmpegthumbnailer gvfs-mtp \
  slurp satty \
  mpv evince imv \
  chromium

# Add screen recorder based on GPU
if lspci | grep -qi 'nvidia'; then
  sudo pacman -S --noconfirm --needed wf-recorder
else
  ## TODO: find solution outside of AUR
  # sudo pacman -S --noconfirm --needed wl-screenrec
fi
