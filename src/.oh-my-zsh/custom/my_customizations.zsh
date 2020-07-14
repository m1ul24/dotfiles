alias ls='ls -G'
alias ll='ls -al'
alias vim='nvim'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt EXTENDED_HISTORY

setopt prompt_subst

export EDITOR=/usr/local/bin/nvim
export ZSH_THEME=gentoo

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""' # show dotfiles
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# n
export N_PREFIX=$HOME/.n
export PATH=$HOME/.n/bin:$PATH

# rbenv
eval "$(rbenv init -)"

