case ${OSTYPE} in
  darwin*)
    [ -f "${ZDOTDIR:-${HOME}}/.zshrc_darwin" ] && . "${ZDOTDIR:-${HOME}}/.zshrc_darwin"
  ;;
  linux*)
    [ -f "${ZDOTDIR:-${HOME}}/.zshrc_linux" ] && . "${ZDOTDIR:-${HOME}}/.zshrc_linux"
  ;;
esac

alias ll='ls -al'
