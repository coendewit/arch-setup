#!/bin/bash

mkdir -p ~/.local/bin
for script in ./bin/*.sh; do
  sudo cp "$script" ~/.local/bin/
  sudo chmod +x ~/bin/$(basename "$script")
done

# add ~/bin to PATH if not already there
if ! grep -q '~/.local/bin' <<<"$PATH"; then
  export PATH="$PATH:~/.local/bin"
fi
