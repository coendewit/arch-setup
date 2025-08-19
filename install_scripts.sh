#!/bin/bash

mkdir -p ~/.local/bin
for script in ./bin/*.sh; do
  sudo cp "$script" ~/.local/bin/
  sudo chmod +x ~/.local/bin/$(basename "$script")
done
