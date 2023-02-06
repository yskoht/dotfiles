#!/usr/bin/make -f
DOT := $(HOME)/.dotfiles
DOT_VIM_CONF  := $(DOT)/vim/vimrc.vim

.PHONY: conf
conf:
	echo "source $(DOT_VIM_CONF)" >> $(HOME)/.vimrc

.PHONY: plug
plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "----"
	@echo 'type ":PlugInstall" in vim console after vim-install-plug'
