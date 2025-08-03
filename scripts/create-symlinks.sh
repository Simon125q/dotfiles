#!/usr/bin/env bash

SYMLINK_LIST="${1:-symlinks.txt}"

while IFS= read -r line; do
    # Skip comments and empty lines
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

    src=$(echo "$line" | awk '{print $1}')
    dest=$(echo "$line" | awk '{print $2}')

    if [[ -z "$src" || -z "$dest" ]]; then
        echo "Invalid line (missing source or destination): $line"
        continue
    fi

    if [[ ! -e "$src" ]]; then
        echo "Source does not exist: $src"
        continue
    fi

    if [[ -L "$dest" ]]; then
        echo "Destination is a symlink, removing: $dest"
        rm "$dest"
    elif [[ -e "$dest" ]]; then
        echo "Destination exists and is a file or directory: $dest"
        read -p "Remove $dest? [y/N]: " confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            rm -rf "$dest"
            echo "Removed: $dest"
        else
            echo "Skipped: $dest"
            continue
        fi
    fi

    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    if [[ $? -eq 0 ]]; then
        echo "Symlink created: $dest -> $src"
    else
        echo "Failed to create symlink: $dest -> $src"
    fi
done < "$SYMLINK_LIST"
