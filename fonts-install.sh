#!/bin/bash

# solarized
if [ -d ~/gnome-terminal-colors-solarized ]; then
  echo "Already installed gnome-terminal-colors-solarized"
else
  echo "Installing: gnome-terminal-colors-solarized"
  git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
  cd gnome-terminal-colors-solarized
  ./install.sh
fi

# for nerdtree
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# powerline
install fonts-powerline

fc-cache -f -v
echo "Clear font cache"

