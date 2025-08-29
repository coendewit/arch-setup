#!/usr/bin/env bash
set -euo pipefail

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

echo -e "${YELLOW}==> Rebuilding sqlite with extension loading enabled...${NC}"

# Requirements
sudo pacman -S --needed --noconfirm git base-devel

# Temp build dir
tmpdir=$(mktemp -d)
pushd "$tmpdir" >/dev/null

# Clone Arch packaging repo
git clone https://gitlab.archlinux.org/archlinux/packaging/packages/sqlite.git
cd sqlite

# Patch PKGBUILD to add extension support if not already there
if ! grep -q -- "--enable-load-extension" PKGBUILD; then
  sed -i 's|--disable-editline|--disable-editline --enable-load-extension|' PKGBUILD
  echo -e "${YELLOW}Patched PKGBUILD to include --enable-load-extension${NC}"
else
  echo -e "${GREEN}PKGBUILD already includes --enable-load-extension${NC}"
fi

# Build and install
makepkg -si --noconfirm

popd >/dev/null
rm -rf "$tmpdir"

echo -e "${GREEN}✅ sqlite rebuilt successfully with extension loading enabled${NC}"
echo
echo "Test it with:"
echo "    sqlite3 :memory: 'pragma compile_options;' | grep ENABLE_LOAD_EXTENSION"
