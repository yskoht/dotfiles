# -*- coding: utf-8-unix -*-

# history
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
shopt -u histappend

