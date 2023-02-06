#!/usr/bin/make -f

.PHONY: zplug
zplug:
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

.PHONY: zsh-completions
zsh-completions:
	chmod -R go-w '/opt/homebrew/share'
	chmod -R go-w '/opt/homebrew/share/zsh'

.PHONY: conf
conf:
	cat dot-zshrc.sh >> $(HOME)/.zshrc
