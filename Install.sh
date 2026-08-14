#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
sudo pacman -S --needed tesseract tesseract-data-eng grim slurp wl-clipboard libnotify

echo "Making ocr-clipboard.sh executable..."
chmod +x ocr-clipboard.sh

echo ""
echo "Done! Now add this to your Hyprland config (custom.lua for ML4W):"
echo 'hl.bind("SUPER + O", hl.dsp.exec_cmd("'"$(pwd)"'/ocr-clipboard.sh"), { description = "OCR screenshot to clipboard" })'
