#!/usr/bin/make -f
DOT := $(HOME)/.dotfiles

BASH_CONF  := $(HOME)/.bash_profile
GIT_CONF   := $(HOME)/.gitconfig
TMUX_CONF  := $(HOME)/.tmux.conf
VIM_CONF   := $(HOME)/.vimrc

DOT_BASH       := $(DOT)/bash
DOT_FONT       := $(DOT)/font
DOT_POWERLINE  := $(DOT_FONT)/powerline
DOT_VIM        := $(DOT)/vim
DOT_VIM_BUNDLE := $(DOT_VIM)/bundle

DOT_BASH_CONF        := $(DOT_BASH)/bash_profile
DOT_GIT_CONF         := $(DOT)/gitconfig
DOT_IMAGEMAGICK_CONF := $(DOT_BASH)/imagemagick.sh
DOT_NODE_CONF        := $(DOT_BASH)/node.sh
DOT_PYENV_CONF       := $(DOT_BASH)/pyenv.sh
DOT_RBENV_CONF       := $(DOT_BASH)/rbenv.sh
DOT_TMUX_CONF        := $(DOT)/tmux.conf
DOT_VIM_CONF         := $(DOT_VIM)/vimrc

message = "\n$1$1 $2 $1$1"
echo_install_title = @echo $(call message,⚡️,$1)
echo_conf_title    = @echo $(call message,✍️ ,$1)
echo_sudo_title    = @echo $(call message,❗️,$1)
echo_setup_title   = @echo $(call message,⚙ ,$1)
echo_other_title   = @echo $(call message,☘ ,$1)
echo_message       = @echo $(call message,🙇,$1)

install_brew := $(shell if [ "$$(which brew)" == "" ]; then echo "brew"; fi)
all_target   := $(shell cat $(DOT)/dotfiles.mk | ruby -ne '$$_.match(/^([^\-\s\.]*):.*$$/){|m| puts m[1]}')
target       := $(filter-out all brew help,$(all_target))


.PHONY: help
help:
	@echo "./dotfiles.mk [stuff-[install|setup|conf]]"
	@echo "  [stuff] $(all_target)"

.PHONY: all
all: $(install_brew) $(target)

# brew
.PHONY: brew-install brew-bundle-dump
brew-install:
	$(call echo_install_title,$@)
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
brew-bundle-dump:
	$(call echo_other_title,$@)
	brew bundle dump

# cask
.PHONY: cask cask-install
cask: cask-install
cask-install:
	$(call echo_install_title,$@)
	brew install cask

# bash
.PHONY: bash bash-conf bash-addsh bash-chsh
bash: bash-conf
bash-conf:
	$(call echo_conf_title,$@)
	echo "source $(DOT_BASH_CONF)"      >>$(BASH_CONF)
bash-addsh:
	$(call echo_sudo_title,$@)
	echo "$$(which bash" >> /etc/shells
bash-chsh:
	$(call echo_sudo_title,$@)
	chsh -s "$$(which bash)"

# git
.PHONY: git git-setup git-setup-bash git-conf
git: git-setup git-conf
git-setup: git-setup-bash
git-setup-bash:
	$(call echo_setup_title,$@)
	brew install bash-git-prompt bash-completion@2
git-conf:
	$(call echo_conf_title,$@)
	echo "[include]\n\tpath = $(DOT_GIT_CONF)" >>$(GIT_CONF)

# iTems2 theme
.PHONY: iterm-theme-install
item-theme-install:
	$(call echo_install_title,$@)
	git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git
	# ->Brogrammer
	# Japanesque
	# Thayer Bright

# node
.PHONY: node nodebrew-install nodebrew-conf yarn-install avn-install
node: nodebrew-install nodebrew-conf yarn-install avn-install
nodebrew-install:
	$(call echo_install_title,$@)
	curl -L git.io/nodebrew | perl - setup
nodebrew-conf:
	$(call echo_conf_title,$@)
	echo 'export PATH=$${HOME}/.nodebrew/current/bin:$${PATH}' >$(DOT_NODE_CONF)
yarn-install:
	$(call echo_install_title,$@)
	brew install yarn --without-node
avn-install:
	$(call echo_install_title,$@)
	npm install -g avn-nodebrew
node-v10.6.0-install:
	$(call echo_install_title,$@)
	nodebrew install-binary v10.6.0
	nodebrew use v10.6.0

# pyenv
.PHONY: pyenv pyenv-install pyenv-conf
pyenv: pyenv-install pyenv-conf
pyenv-install:
	$(call echo_install_title,$@)
	brew install pyenv pyenv-virtualenv
pyenv-conf:
	$(call echo_conf_title,$@)
	echo 'export PYENV_ROOT="$${HOME}/.pyenv"'        >$(DOT_PYENV_CONF)
	echo 'export PATH="$${PYENV_ROOT}/bin:$${PATH}"' >>$(DOT_PYENV_CONF)
	echo 'eval "$$(pyenv init -)"'                   >>$(DOT_PYENV_CONF)
	echo 'eval "$$(pyenv virtualenv-init -)"'        >>$(DOT_PYENV_CONF)
anaconda3-5.2.0-install:
	$(call echo_install_title,$@)
	pyenv install anaconda3-5.2.0
	pyenv global anaconda3-5.2.0
	
# rbenv
.PHONY: rbenv rbenv-install rbenv-conf
rbenv: rbenv-install rbenv-conf
rbenv-install:
	$(call echo_install_title,$@)
	brew install rbenv ruby-build rbenv-gemset
rbenv-conf:
	$(call echo_conf_title,$@)
	echo 'export PATH="$${HOME}/.rbenv/bin:$${PATH}"' >$(DOT_RBENV_CONF)
	echo 'eval "$$(rbenv init -)"'                   >>$(DOT_RBENV_CONF)
ruby-v2.5.1-install:
	$(call echo_install_title,$@)
	rbenv install 2.5.1
	rbenv global 2.5.1


# tmux
.PHONY: tmux tmux-conf
tmux: tmux-conf
tmux-conf:
	$(call echo_conf_title,$@)
	echo "source-file $(DOT_TMUX_CONF)" >>$(TMUX_CONF)

# vim
.PHONY: vim vim-install-plug vim-conf
vim: vim-install-plug vim-conf
vim-install-plug:
	$(call echo_install_title,$@)
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo '*****'
	echo '*****'
	echo '*****'
	echo 'type `:PlugInstall` in vim console after vim-install-plug'
vim-conf:
	$(call echo_conf_title,$@)
	echo "source $(DOT_VIM_CONF)" >>$(VIM_CONF)



# asciinema
.PHONY: asciicast2gif-install
asciicast2gif-install:
	$(call echo_install_title,$@)
	docker pull asciinema/asciicast2gif

# qmk-env
.PHONY: qmkenv
qmkenv: qmkenv-install
qmkenv-install:
	$(call echo_install_title,$@)
	brew tap osx-cross/avr
	brew tap PX4/homebrew-px4
	brew update
	brew install avr-gcc@7
	brew install dfu-programmer
	brew install gcc-arm-none-eabi
	brew install avrdude


