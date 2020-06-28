#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle --file ./Brewfile

function linkFile {
  src="${PWD}/src/${1}"
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ${dest} ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}

  elif [ -f ${dest} ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d ${dest} ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${src} ${dest}
}

case ${SHELL} in
  *bash)
    linkDotfile .bashrc
  ;;
  *zsh)
    linkDotfile .zshrc
    linkDotfile .zshrc_darwin
  ;;
esac

linkFile .tmux.conf
linkFile .config/nvim/init.vim

