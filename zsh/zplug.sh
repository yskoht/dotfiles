if [ -f ${HOME}/.zplug/init.zsh ]; then
  source ${HOME}/.zplug/init.zsh

  zplug "woefe/git-prompt.zsh"
  zplug load
fi

