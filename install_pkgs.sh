#!/usr/bin/env bash

# Path to your package list file
PKG_FILE="apt"

# Exit if file does not exist
if [[ ! -f "$PKG_FILE" ]]; then
    echo "Error: package list file '$PKG_FILE' not found."
    exit 1
fi

# Read the file, ignore comments and empty lines, and install each package
while IFS= read -r pkg; do
    # Skip empty lines or lines starting with '#'
    [[ -z "$pkg" || "$pkg" == \#* ]] && continue

    echo "Installing: $pkg"
    sudo apt-get install -y "$pkg"
done < "$PKG_FILE"

echo "All packages processed."
