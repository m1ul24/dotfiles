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

export PATH=/usr/local/bin:$PATH

# rbenv
eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/shims:$PATH

# n
export N_PREFIX=$HOME/.n
export PATH=$HOME/.n/bin:$PATH

# go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

certspotter(){
  mkdir -p ~/hack/$1
  curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | grep $1 | sort -u | tee ~/hack/$1/dns_names.txt
}

dirbruteforce(){
  while read line; do python3 ~/tools/dirsearch/dirsearch.py -e . -u "https://$line"; done < $1
}

screenshot(){
  python3 ~/tools/webscreenshot/webscreenshot.py -i $1 --timeout=10 -m
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/m1ul24/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/m1ul24/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/m1ul24/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/m1ul24/google-cloud-sdk/completion.zsh.inc'; fi
