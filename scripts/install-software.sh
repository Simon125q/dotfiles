#!/usr/bin/env bash

set -e

SOFTWARE_LIST="${1:-software-list.txt}"
DOWNLOAD_DIR="$HOME/Downloads"

# Detect package manager
if command -v apt &>/dev/null; then
    PKG_INSTALL="sudo apt-get install -y"
    PKG_UPDATE="sudo apt-get update"
elif command -v dnf &>/dev/null; then
    PKG_INSTALL="sudo dnf install -y"
    PKG_UPDATE="sudo dnf check-update"
elif command -v pacman &>/dev/null; then
    PKG_INSTALL="sudo pacman -S --noconfirm"
    PKG_UPDATE="sudo pacman -Sy"
else
    echo "No supported package manager found!"
    exit 1
fi

# Update package lists
echo "Updating package lists..."
$PKG_UPDATE

# Ensure flatpak is installed
if ! command -v flatpak &>/dev/null; then
    echo "Installing flatpak..."
    $PKG_INSTALL flatpak
fi

mkdir -p "$DOWNLOAD_DIR"

while IFS= read -r line; do
    # Skip comments and empty lines
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

    type="${line%%:*}"
    value="${line#*:}"

    case "$type" in
        apt|dnf|pacman)
            echo "Installing $value via package manager..."
            $PKG_INSTALL "$value"
            ;;
        flatpak)
            echo "Installing $value via Flatpak..."
            flatpak install -y flathub "$value"
            ;;
        appimage)
            echo "Downloading AppImage: $value"
            filename="${value##*/}"
            wget -O "$DOWNLOAD_DIR/$filename" "$value"
            chmod +x "$DOWNLOAD_DIR/$filename"
            echo "AppImage saved to $DOWNLOAD_DIR/$filename"
            ;;
        wget)
            echo "Downloading via wget: $value"
            wget -P "$DOWNLOAD_DIR" "$value"
            ;;
        curl)
            echo "Downloading via curl: $value"
            filename="${value##*/}"
            curl -L "$value" -o "$DOWNLOAD_DIR/$filename"
            ;;
        *)
            echo "Unknown type: $type"
            ;;
    esac
done < "$SOFTWARE_LIST"

echo "All done!"
