#!/usr/bin/make -f
DOT := $(HOME)/.dotfiles

.PHONY: bundle
bundle: install
	brew bundle --verbose

.PHONY: install
install:
	if !(type "brew" > /dev/null 2>&1); then\
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";\
	fi
	brew update

