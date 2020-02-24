#!/bin/bash

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    apt install $1
  else
    echo "Already installed: ${1}"
  fi
}

install tmux
install nvim
install dconf-cli # required for https://github.com/aruhier/gnome-terminal-colors-solarized

