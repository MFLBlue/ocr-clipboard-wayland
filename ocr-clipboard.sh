#!/usr/bin/env bash
set -e

TMPIMG=$(mktemp /tmp/ocr-XXXXXX.png)
trap 'rm -f "$TMPIMG"' EXIT

geom=$(slurp) || exit 1
grim -g "$geom" "$TMPIMG"

text=$(tesseract "$TMPIMG" - 2>/dev/null | sed -e 's/[[:space:]]*$//')

if [ -z "$text" ]; then
    notify-send "OCR" "No text found"
    exit 1
fi

echo -n "$text" | wl-copy
notify-send "OCR" "Copied to clipboard:
$(echo "$text" | head -c 100)"
