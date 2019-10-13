# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

export FZF_DEFAULT_OPTS='--border --reverse --height 90% --preview-window right:80% --bind ctrl-p:preview-up,ctrl-n:preview-down,ctrl-d:preview-page-down,ctrl-u:preview-page-up'

# Key bindings
# ------------
source "${DOT_BASH}/fzf/key-bindings.bash"
source "${DOT_BASH}/fzf/my-key-bindings.bash"
