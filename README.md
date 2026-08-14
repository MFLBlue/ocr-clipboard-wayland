# ocr-clipboard-wayland
# OCR Clipboard Shortcut

A simple keybind for Wayland compositors (built/tested on Hyprland) that lets you drag-select any region of your screen and instantly OCR the text straight to your clipboard.

## Dependencies

```bash
sudo pacman -S tesseract tesseract-data-eng grim slurp wl-clipboard libnotify
```

## Setup

1. Copy `ocr-clipboard.sh` to `~/scripts/` and make it executable:
```bash
   chmod +x ~/scripts/ocr-clipboard.sh
```
2. Add a keybind in your compositor's config. For Hyprland:
```lua
   hl.bind("SUPER + O", hl.dsp.exec_cmd("~/scripts/ocr-clipboard.sh"), { description = "OCR screenshot to clipboard" })
```

## Usage

Press your keybind, drag-select a region of screen, and the text inside gets copied to your clipboard with a confirmation notification.
