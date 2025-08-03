#!/usr/bin/env bash

# Ensure TPM is installed
if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

# Install plugins (requires tmux to be running)
if pgrep tmux >/dev/null; then
    "$HOME/.config/tmux/plugins/tpm/bin/install_plugins"
else
    echo "Start tmux and press prefix + I to install plugins."
fi
