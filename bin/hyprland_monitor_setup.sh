#!/bin/bash

# Detect monitors
EXTERNAL_MONITOR=$(hyprctl monitors | grep "DP-2" | grep -o "DP-2")

if [ -n "$EXTERNAL_MONITOR" ]; then
  # External monitor is connected
  rm -f /.config/hypr/workspaces.conf
  ln -sf /.config/hypr/workspaces-desktop.conf /.config/hypr/workspaces.conf
else
  rm -f /.config/hypr/workspaces.conf
  ln -sf /.config/hypr/workspaces-laptop.conf /.config/hypr/workspaces.conf
fi
