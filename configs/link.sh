#!/bin/bash

SOURCE="$HOME/dotfiles/configs"
TARGET="$HOME/.config"

for dir in "$SOURCE"/*; do
    name=$(basename "$dir")
    ln -sfn "$dir" "$TARGET/$name"
done
