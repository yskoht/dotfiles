
# ls
alias ls='ls -FG'
alias sl='ls'
alias ll='ls -l'
alias la='ls -al'
export LSCOLORS=gxfxcxdxbxegedabagacad

# alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ssh='ssh -Y'

alias vi='vim'
alias diff='diff -u'
alias od='od -tx1 -Ax'

alias rb='ruby -ne'
alias rba='ruby -nae'
alias rbc='ruby -F, -nae'

alias tree='pwd;find . | grep -v "\/\." | sort | sed "1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g"'
alias treea='pwd;find . | sort | sed "1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g"'

alias httpsrv='python -m SimpleHTTPServer'

alias g='git'
alias y='yarn'
alias yr='yarn run'
alias r='rails'
alias b='bundle'
alias be='bundle exec'
alias t='tmux'
alias nr='npm run'
alias ns='npm start'
alias av='aws-vault'
alias k='kubectl'
alias jf='pbpaste | jq . | pbcopy'

