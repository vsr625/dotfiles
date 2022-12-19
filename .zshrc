export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(git z per-directory-history zsh-autosuggestions zsh-syntax-highlighting)

export _Z_CMD="c"

DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# Custom Configuration
DOTFILES_HOME=~/personal/dotfiles
alias v="XDG_CONFIG_HOME=$DOTFILES_HOME nvim"
alias vim="XDG_CONFIG_HOME=$DOTFILES_HOME nvim"
alias e="exit"
alias t="tmux attach -t base || tmux new -s base"

# export GOROOT="$HOME/go/go1.19.2"
export GOPATH="$HOME"/go
export GOPRIVATE="*.golabs.io"
export EDITOR="nvim"

# Change auto-suggestion highlight color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

bindkey -v
export KEYTIMEOUT=1

bindkey "^G" per-directory-history-toggle-history
bindkey "^H" backward-kill-word
bindkey "^P" up-history
bindkey "^N" down-history

bindkey -M vicmd v edit-command-line

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Fzf stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ruby stuff
eval "$(rbenv init -)"
export PATH="~/.rbenv/shims:/opt/homebrew/opt/go@1.16/bin:$GOPATH/bin:$PATH:$HOME/work/setup/scripts:$GOPATH/bin"

# gcloud-sdk
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# Rust setup
source "$HOME/.cargo/env"

# Prompt things
eval "$(starship init zsh)"
