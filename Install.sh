#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
sudo pacman -S --needed tesseract tesseract-data-eng grim slurp wl-clipboard libnotify

echo "Making ocr-clipboard.sh executable..."
chmod +x ocr-clipboard.sh

SCRIPT_PATH="$(pwd)/ocr-clipboard.sh"
BIND_LINE='hl.bind("SUPER + O", hl.dsp.exec_cmd("'"$SCRIPT_PATH"'"), { description = "OCR screenshot to clipboard" })'
CUSTOM_LUA="$HOME/.config/hypr/custom.lua"

echo ""
if [ ! -f "$CUSTOM_LUA" ]; then
    echo "custom.lua not found — creating it."
    mkdir -p "$(dirname "$CUSTOM_LUA")"
    touch "$CUSTOM_LUA"
fi

echo "Found $CUSTOM_LUA"
read -p "Add the keybind automatically? [y/N] " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    if grep -q "ocr-clipboard.sh" "$CUSTOM_LUA"; then
        echo "Keybind already present, skipping."
    else
        cp "$CUSTOM_LUA" "$CUSTOM_LUA.bak"
        echo "$BIND_LINE" >> "$CUSTOM_LUA"
        echo "Added. Backup saved as custom.lua.bak"
        if command -v hyprctl &> /dev/null; then
            hyprctl reload
            echo "Hyprland config reloaded — keybind should be live now."
        fi
    fi
else
    echo "Skipped. Add this line yourself:"
    echo "$BIND_LINE"
fi
