# -*- coding: utf-8-unix -*-

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

#export PS1='\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '
export PS1='\[\033[0;32m\]\u@\h\[\033[0;91m\]$(__git_ps1)'$' \[\033[0;33m\]\w\[\033[0m\]\n$ '

