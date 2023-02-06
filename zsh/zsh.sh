DOT=${HOME}/.dotfiles
DOT_ZSH=${DOT}/zsh

function s() {
  if [[ -f "$1" ]]; then
    source "$1"
  fi
}

s ${DOT_ZSH}/zplug.sh

s ${DOT_ZSH}/asdf.sh
s ${DOT_ZSH}/alias.sh
s ${DOT_ZSH}/brew.sh
s ${DOT_ZSH}/direnv.sh
s ${DOT_ZSH}/fzf.sh
s ${DOT_ZSH}/history.sh
s ${DOT_ZSH}/ignoreeof.sh
# s ${DOT_ZSH}/kubernetes.sh
s ${DOT_ZSH}/prompt.sh
s ${DOT_ZSH}/zsh-autosuggestions.sh
s ${DOT_ZSH}/zsh-completions.sh
