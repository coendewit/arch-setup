#!/bin/bash

# Function to check for and install a package
install_if_not_found() {
  if ! pacman -Q "$1" &>/dev/null; then
    echo "Installing $1..."
    sudo pacman -S --noconfirm "$1"
  else
    echo "$1 is already installed."
  fi
}

# Function to create an idempotent symbolic link. It will create the directory if needed
# Usage: create_symlink <source_file_or_dir> <destination_link>
create_symlink() {
  local source="$1"
  local destination="$2"

  # Extract the directory path of the destination
  local dest_dir=$(dirname "$destination")

  # Create the parent directory if it doesn't exist
  if [ ! -d "$dest_dir" ]; then
    echo "Creating directory: $dest_dir"
    mkdir -p "$dest_dir"
  fi

  # Check if the destination exists and remove it
  if [ -e "$destination" ]; then
    echo "Removing existing item at '$destination'..."
    rm -rf "$destination"
  fi

  # Create the new symbolic link
  echo "Creating symbolic link from '$source' to '$destination'..."
  ln -s "$source" "$destination"
}

create_webapp() {
  if [ "$#" -ne 3 ]; then
    echo -e "\e[32mLet's create a new web app you can start with the app launcher.\n\e[0m"
    APP_NAME=$(gum input --prompt "Name> " --placeholder "My favorite web app")
    APP_URL=$(gum input --prompt "URL> " --placeholder "https://example.com")
    ICON_URL=$(gum input --prompt "Icon URL> " --placeholder "See https://dashboardicons.com (must use PNG!)")
  else
    APP_NAME="$1"
    APP_URL="$2"
    ICON_URL="$3"
  fi

  if [[ -z "$APP_NAME" || -z "$APP_URL" || -z "$ICON_URL" ]]; then
    echo "You must set app name, app URL, and icon URL!"
    exit 1
  fi

  ICON_DIR="$HOME/.local/share/applications/icons"
  DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"
  ICON_PATH="$ICON_DIR/$APP_NAME.png"

  mkdir -p "$ICON_DIR"

  if ! curl -sL -o "$ICON_PATH" "$ICON_URL"; then
    echo "Error: Failed to download icon."
    return 1
  fi

  cat >"$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=$APP_NAME
Exec=chromium --new-window --ozone-platform=wayland --app="$APP_URL" --name="$APP_NAME" --class="$APP_NAME"
Terminal=false
Type=Application
Icon=$ICON_PATH
StartupNotify=true
EOF

  chmod +x "$DESKTOP_FILE"

  if [ "$#" -ne 3 ]; then
    echo -e "You can now find $APP_NAME using the app launcher (SUPER + SPACE)\n"
  fi
}
