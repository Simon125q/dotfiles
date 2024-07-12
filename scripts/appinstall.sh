#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install fzf
install bat
install ripgrep
install lsd
#install lf
install wget
install curl
install git
install htop
install tmux
install nvim


# fun stuff
install neofetch
#install figlet
#install lolcat

# Run other installations scripts

curl -sS https://starship.rs/install.sh | sh


