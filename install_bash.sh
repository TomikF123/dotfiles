#!/usr/bin/env bash

DOTFILES_DIR="$HOME/dotfiles/bash"

FILES=(
  bashrc
  bash_aliases
  bash_exports
)

for file in "${FILES[@]}"; do
    src="$DOTFILES_DIR/$file"
    dest="$HOME/.${file}"

    if [[ -e "$dest" || -L "$dest" ]]; then
        echo "Removing existing file: $dest"
        rm -f "$dest"
    fi

    echo "Linking $src → $dest"
    ln -s "$src" "$dest"
done

echo "Done!"
