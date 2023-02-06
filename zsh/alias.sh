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
#alias od='od -tx1 -Ax'
alias od='hexyl'

alias rb='ruby -ne'
alias rba='ruby -nae'
alias rbc='ruby -F, -nae'

alias httpsrv='python -m SimpleHTTPServer'

alias g='git'
alias y='yarn'
alias yr='yarn run'
alias yw='yarn workspace'
alias b='bundle'
alias be='bundle exec'
alias t='tmux'
alias nr='npm run'
alias k='kubectl'
alias jf='pbpaste | jq . | pbcopy'
alias p='pnpm'

alias pr='gh pr view'
alias prw='gh pr view --web'
alias prs='gh pr list -A yskoht | grep "^#*" | fzf | awk "{ print \$1 }" | xargs gh pr view --web'
