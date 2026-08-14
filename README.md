# OCR Clipboard Shortcut

A simple script for Wayland compositors that lets you drag-select any region of your screen and instantly OCR the text straight to your clipboard.

Built and tested on Hyprland (specifically ML4W's dotfiles), but the script itself works on any Wayland compositor — only the keybind syntax below is Hyprland/ML4W-specific.

## Dependencies

- `tesseract` — OCR engine
- `grim` — screenshot tool
- `slurp` — region selector
- `wl-clipboard` — clipboard access
- `libnotify` — desktop notifications

## Setup

**Option A — automatic:**
```bash
git clone https://github.com/MFLBlue/ocr-clipboard-wayland.git
cd ocr-clipboard-wayland
chmod +x install.sh
./install.sh
```
This installs all dependencies (Arch/pacman) and makes the script executable, then prints a ready-to-use bind line.

**Option B — manual:**
```bash
sudo pacman -S tesseract tesseract-data-eng grim slurp wl-clipboard libnotify
chmod +x ocr-clipboard.sh
```
(swap `pacman` for your distro's package manager if you're not on Arch)

## Adding the keybind

**Hyprland (ML4W / Lua config)** — add to `~/.config/hypr/custom.lua`:
```lua
hl.bind("SUPER + O", hl.dsp.exec_cmd("~/path/to/ocr-clipboard.sh"), { description = "OCR screenshot to clipboard" })
```

**Hyprland (older `.conf` format)**:
