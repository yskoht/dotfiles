if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

source ${HOME}/.dotfiles/zsh/zsh.sh
