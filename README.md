# Dotfiles & Software Setup

---

## dotfiles

This repository contains dotfiles for configuring various software including:

- nvim
- tmux
- zshrc
- bashrc (old)
- kitty
- starship
- yazi

---

## scripts

- **install-software.sh** — Installs software from a list using system package manager, Flatpak, or by downloading AppImages and other files.
- **create-symlinks.sh** — Creates symbolic links (symlinks) for configuration files and directories, making it easy to manage dotfiles.

---

### 1. install-software.sh

**What it does:**  
Reads a list of software and installs each item using the appropriate method (system package manager, Flatpak, AppImage, wget, or curl).

**How to use:**

1. **Prepare software list:**  
   Create a file (e.g., `software-list.txt`) with one entry per line, using the format:

   ```
   <type>:<name or url>
   ```

   Example:

   ```
   apt:htop
   flatpak:org.gimp.GIMP
   appimage:https://example.com/app.AppImage
   wget:https://example.com/file.tar.gz
   ```

2. **Run the script:**
   ```bash
   chmod +x install-software.sh
   ./install-software.sh
   ```
   Or specify a different list:
   ```bash
   ./install-software.sh my-software.txt
   ```

---

### 2. create-symlinks.sh

**What it does:**  
Reads a list of source and destination paths and creates symlinks. If the destination exists:

- Removes it automatically if it’s a symlink.
- Prompts for confirmation if it’s a file or directory.

**How to use:**

1. **Prepare your symlink list:**  
   Create a file (e.g., `symlinks.txt`) with one entry per line, using the format:

   ```
   <source> <destination>
   ```

   Example:

   ```
   /home/user/dotfiles/.vimrc /home/user/.vimrc
   /home/user/dotfiles/.config/nvim /home/user/.config/nvim
   ```

2. **Run the script:**
   ```bash
   chmod +x create-symlinks.sh
   ./create-symlinks.sh
   ```
   Or specify a different list:
   ```bash
   ./create-symlinks.sh my-links.txt
   ```
