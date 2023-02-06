#!/usr/bin/make -f
DOT := $(HOME)/.dotfiles
DOT_TMUX_CONF  := $(DOT)/tmux/tmux.conf

.PHONY: conf
conf:
	echo "source-file $(DOT_TMUX_CONF)" >> $(HOME)/.tmux.conf

.PHONY: tpm
tpm:
	git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
	@echo "----"
	@echo "Press prefix + 'I'"
