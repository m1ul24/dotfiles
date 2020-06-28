#!/bin/bash

function linkFile {
  src="${PWD}/src/${1}"
  dest="${HOME}/${1}"
  destDir=$(dirname ${dest})
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

  if [ ! -d ${destDir} ]; then
    echo "Creating directory: ${destDir}"
    mkdir -p ${destDir}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${src} ${dest}
}

case ${SHELL} in
  *bash)
    linkFile .bashrc
  ;;
  *zsh)
    linkFile .zshrc
    linkFile .zshrc_darwin
  ;;
esac

linkFile .editorconfig
linkFile .tmux.conf
linkFile .config/nvim/init.vim

exec $SHELL -l
