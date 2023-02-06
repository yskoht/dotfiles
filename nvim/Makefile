#!/usr/bin/make -f
DOT := $(HOME)/.dotfiles
DOT_VIM_CONF  := $(DOT)/nvim/init.vim

.PHONY: conf
conf:
	mkdir -p $(HOME)/.config/nvim
	echo "source $(DOT_VIM_CONF)" >> $(HOME)/.config/nvim/init.vim

