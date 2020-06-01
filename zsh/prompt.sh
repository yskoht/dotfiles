# -*- coding: utf-8-unix -*-
source "${DOT_ZSH}/zsh-git-prompt/zshrc.sh"
PROMPT='%F{cyan}%n@%m%f $(git_super_status) %F{yellow}%~%f
$ '

