#!/bin/bash

set -e

if [[ $# -lt 1 ]]; then
    echo "Usage: $(basename "$0") <binary-path> [name] [icon-path]"
    echo "Example: $(basename "$0") /opt/dbeaver/dbeaver DBeaver /opt/dbeaver/icon.xpm"
    exit 1
fi

BINARY_PATH="$1"
APP_NAME="${2:-$(basename "$BINARY_PATH")}"
ICON_PATH="${3:-}"

# Resolve to absolute path
if [[ ! "$BINARY_PATH" = /* ]]; then
    BINARY_PATH="$(realpath "$BINARY_PATH")"
fi

# Check if binary exists
if [[ ! -f "$BINARY_PATH" ]]; then
    echo "Error: Binary not found: $BINARY_PATH"
    exit 1
fi

# Create applications directory if needed
DESKTOP_DIR="$HOME/.local/share/applications"
mkdir -p "$DESKTOP_DIR"

# Generate desktop file name
DESKTOP_FILE="$DESKTOP_DIR/${APP_NAME,,}.desktop"

# Create the desktop entry
cat > "$DESKTOP_FILE" << EOF
[Desktop Entry]
Name=$APP_NAME
Comment=$APP_NAME application
Exec=$BINARY_PATH
Icon=${ICON_PATH:-application-x-executable}
Type=Application
Categories=Utility;
Terminal=false
EOF

echo "Created: $DESKTOP_FILE"

# Update desktop database
if command -v update-desktop-database &> /dev/null; then
    update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
fi

echo "Done. $APP_NAME should now appear in rofi."