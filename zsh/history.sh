# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE=""

function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
setopt share_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store

