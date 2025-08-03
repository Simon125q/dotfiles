export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$HOME/.local/opt/go/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/$HOME/.local/bin"
export PATH="$PATH:/opt/jdk-21.0.6+7/bin"
export XDG_CONFIG_HOME="$HOME/.config"

# Set up the prompt
# some more ls aliases

neofetch

alias update='sudo apt update && sudo apt upgrade -y'

alias ls='lsd -F'
alias ll='lsd -lAF'
alias la='lsd -AF'
alias lsa='lsd -A'
alias l='ls -CF'

# git aliases
alias lgit='git --oneline --decorate --tree --all'

# neovim aliases
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias svim='sudo nvim'
alias sv='sudo nvim'

# bat aliases
alias bat='batcat --color=always'

# fzf aliases
alias fzf="fzf --preview='batcat --color=always {}'"
alias inv='nvim $(fzf --preview="batcat --color=always {}")'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source /home/simon/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR=nvim
