#!/bin/bash

echo "=== Install and configure development tools ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "$SCRIPT_DIR/../helper_functions.sh"

install_if_not_found libspatialite

## Add the following to .zshrc
if [ ! -f ~/.zshrc ]; then
  return
fi

if ! grep -q "export LD_LIBRARY_PATH" ~/.zshrc; then
  echo "EXPORT LD_LIBRARY_PATH=/usr/local/lib:/usr/lib" >>~/.zshrc
fi
