#!/usr/bin/env bash
set -euo pipefail

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

# Get versions
sqlite_ver=$(pacman -Q sqlite | awk '{print $2}')
spatialite_ver=$(pacman -Q libspatialite | awk '{print $2}')

echo -e "${YELLOW}SQLite:      $sqlite_ver${NC}"
echo -e "${YELLOW}libspatialite: $spatialite_ver${NC}"

# Get build dates (unix epoch)
sqlite_build=$(pacman -Qi sqlite | awk -F': ' '/Build Date/ {print $2}' | xargs -I{} date -d "{}" +%s)
spatialite_build=$(pacman -Qi libspatialite | awk -F': ' '/Build Date/ {print $2}' | xargs -I{} date -d "{}" +%s)

if [[ $spatialite_build -lt $sqlite_build ]]; then
  echo -e "${RED}⚠️ libspatialite may be out of sync with sqlite.${NC}"
  echo -e "${YELLOW}Rebuilding libspatialite...${NC}"

  tmpdir=$(mktemp -d)
  pushd "$tmpdir" >/dev/null

  # Fetch PKGBUILD from Arch repos
  git clone https://gitlab.archlinux.org/archlinux/packaging/packages/libspatialite.git
  cd libspatialite
  makepkg -si --noconfirm

  cd libspatialite

  # Build and install
  makepkg -si --noconfirm

  popd >/dev/null
  rm -rf "$tmpdir"

  echo -e "${GREEN}✅ libspatialite rebuilt successfully!${NC}"
else
  echo -e "${GREEN}✅ libspatialite is in sync with sqlite.${NC}"
fi
