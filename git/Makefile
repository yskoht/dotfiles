#!/usr/bin/make -f
DOT := $(HOME)/.dotfiles
DOT_GIT_CONF   := $(DOT)/git/git.config

.PHONY: conf
conf:
	echo "[include]\n\tpath = $(DOT_GIT_CONF)" >> $(HOME)/.gitconfig
