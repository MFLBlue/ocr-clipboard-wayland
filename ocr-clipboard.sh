#!/usr/bin/env bash
set -e

geom=$(slurp) || exit 1

text=$(grim -g "$geom" - | tesseract - - 2>/dev/null | sed -e 's/[[:space:]]*$//')

if [ -z "$text" ]; then
    notify-send "OCR" "No text found"
    exit 1
fi

printf '%s' "$text" | wl-copy
notify-send "OCR" "Copied to clipboard:
${text:0:100}"
