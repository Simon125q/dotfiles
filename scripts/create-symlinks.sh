#!/usr/bin/env bash
# Creates symlinks from lines "SRC DEST" in symlinks.txt (or file passed as $1)
# Expands env vars like $USER/$HOME from the file.
# Prompts (from the TTY) before replacing an existing non-symlink.

set -uo pipefail

SYMLINK_LIST="${1:-symlinks.txt}"

# Read a Y/N confirmation from the *terminal*, not from the file being read
confirm_tty() {
  local prompt="$1" ans=""
  if [[ -e /dev/tty ]]; then
    # read from the controlling terminal so we don't eat the next file line
    read -r -p "$prompt" ans < /dev/tty
  else
    # No TTY (e.g., cron/non-interactive) -> default to "no"
    echo "$prompt [non-interactive: default N]"
    ans="n"
  fi
  [[ "$ans" =~ ^[Yy]$ ]]
}

while IFS= read -r line || [[ -n "$line" ]]; do
  # Skip comments and blank lines
  [[ "$line" =~ ^[[:space:]]*# || -z "$line" ]] && continue

  # Safely expand $VARS from the line (e.g., $USER, $HOME)
  expanded=$(envsubst <<< "$line")

  # Parse "src dest" (space-separated). If your paths may have spaces,
  # use a delimiter in the file instead.
  read -r src dest <<< "$expanded"

  if [[ -z "${src:-}" || -z "${dest:-}" ]]; then
    echo "Invalid line (missing source or destination): $line"
    continue
  fi

  if [[ ! -e "$src" ]]; then
    echo "Source does not exist: $src"
    continue
  fi

  if [[ -L "$dest" ]]; then
    echo "Destination is a symlink, removing: $dest"
    rm -f -- "$dest"
  elif [[ -e "$dest" ]]; then
    if confirm_tty "Destination exists ($dest). Remove and replace with symlink? [y/N]: "; then
      rm -rf -- "$dest"
      echo "Removed: $dest"
    else
      echo "Skipped: $dest"
      continue
    fi
  fi

  mkdir -p -- "$(dirname -- "$dest")"
  if ln -s -- "$src" "$dest"; then
    echo "Symlink created: $dest -> $src"
  else
    echo "Failed to create symlink: $dest -> $src"
  fi
done < "$SYMLINK_LIST"

