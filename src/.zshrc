case ${OSTYPE} in
  darwin*)
    [ -f "${ZDOTDIR:-${HOME}}/.zshrc_darwin" ] && . "${ZDOTDIR:-${HOME}}/.zshrc_darwin"
  ;;
  linux*)
    [ -f "${ZDOTDIR:-${HOME}}/.zshrc_linux" ] && . "${ZDOTDIR:-${HOME}}/.zshrc_linux"
  ;;
esac

alias ll='ls -al'
alias vim='nvim'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history

# 'Safe' version of __git_ps1 to avoid errors on systems that don't have it
function git_branch {
  branch=`git symbolic-ref --short HEAD 2> /dev/null`
  if [ $? -eq 0 ]; then
    echo " (${branch})"
  fi
}

setopt prompt_subst
export PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f%F{yellow}$(git_branch)%f %# '
# export RPROMPT='[%F{yellow}%?%f]'

export EDITOR=/usr/local/bin/nvim
# export TERM=xterm-256color

ide () {
    tmux split-window -h -p 35
    tmux split-window -v -p 50
}

export N_PREFIX=$HOME/.n
export PATH=$PATH:$HOME/.n/bin

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""' # show dotfiles
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
