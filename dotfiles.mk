#!/usr/bin/make -f
DOT := $(HOME)/.dotfiles

BASH_CONF  := $(HOME)/.bash_profile
EMACS_CONF := $(HOME)/.emacs
FISH_CONF  := $(HOME)/.config/fish/config.fish
GIT_CONF   := $(HOME)/.gitconfig
TMUX_CONF  := $(HOME)/.tmux.conf
VIM_CONF   := $(HOME)/.vimrc

DOT_BASH       := $(DOT)/bash
DOT_EMACS      := $(DOT)/emacs
DOT_FISH       := $(DOT)/fish
DOT_FONT       := $(DOT)/font
DOT_POWERLINE  := $(DOT_FONT)/powerline
DOT_VIM        := $(DOT)/vim
DOT_VIM_BUNDLE := $(DOT_VIM)/bundle

DOT_BASH_CONF        := $(DOT_BASH)/bash_profile
DOT_EMACS_CONF       := $(DOT_EMACS)/emacs.el
DOT_FISH_CONF        := $(DOT_FISH)/config.fish
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

# bash
.PHONY: bash bash-install bash-conf bash-addsh bash-chsh
bash: bash-install bash-conf
bash-install:
	$(call echo_install_title,$@)
	brew install bash
bash-conf:
	$(call echo_conf_title,$@)
	echo "source $(DOT_BASH_CONF)"      >>$(BASH_CONF)
bash-addsh:
	$(call echo_sudo_title,$@)
	echo "$$(which bash" >> /etc/shells
bash-chsh:
	$(call echo_sudo_title,$@)
	chsh -s "$$(which bash)"

# cask
.PHONY: cask cask-install
cask: cask-install
cask-install:
	$(call echo_install_title,$@)
	brew install cask

# emacs
.PHONY: emacs emacs-install emacs-setup emacs-conf
emacs: emacs-install emacs-setup emacs-conf
emacs-install:
	$(call echo_install_title,$@)
	brew cask install emacs
emacs-setup:
	$(call echo_setup_title,$@)
emacs-conf:
	$(call echo_conf_title,$@)
	echo "(load-file \"$(DOT_EMACS_CONF)\")" >>$(EMACS_CONF)

# fish
#.PHONY: fish fish-install fish-conf fish-addsh fish-chsh
#fish: fish-install fish-conf
#fish-install:
#	$(call echo_install_title,$@)
#	brew install fish
#fish-addsh:
#	$(call echo_sudo_title,$@)
#	echo "$$(which fish)" >> /etc/shells
#fish-chsh:
#	$(call echo_sudo_title,$@)
#	chsh -s "$$(which fish)"
#fish-conf:
#	$(call echo_conf_title,$@)
#	echo "source $(DOT_FISH_CONF)" >>$(FISH_CONF)
#
#fisherman-install:
#	$(call echo_install_title,$@)
#	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
#fisherman-setup:
#	$(call echo_setup_title,$@)
#	$$(which fish) -c 'fisher oh-my-fish/plugin-balias'
#	$$(which fish) -c 'fisher z'
#	$$(which fish) -c 'fisher edc/bass'
#	$$(which fish) -c 'fisher omf/theme-agnoster'
#	#$$(which fish) -c 'fisher simnalamburt/shellder'

# fzf
.PHONY: fzf fzf-install fzf-setup
fzf: fzf-install fzf-setup
fzf-install:
	$(call echo_install_title,$@)
	brew install fzf
fzf-setup:
	$(call echo_setup_title,$@)
	#$$(brew --prefix)/opt/fzf/install
fzf-conf:
	$(call echo_conf_title,$@)

# git
.PHONY: git git-install git-setup git-setup-bash git-conf
git: git-install git-setup git-conf
git-install:
	$(call echo_install_title,$@)
	brew install git
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

# powerline font
.PHONY: powerline powerline-install
powerline: powerline-install
powerline-install:
	$(call echo_install_title,$@)
	git clone https://github.com/powerline/fonts.git $(DOT_POWERLINE)
	$(DOT_POWERLINE)/install.sh

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
.PHONY: tmux tmux-install tmux-conf
tmux: tmux-install tmux-conf
tmux-install:
	$(call echo_install_title,$@)
	brew install tmux
tmux-conf:
	$(call echo_conf_title,$@)
	echo "source-file $(DOT_TMUX_CONF)" >>$(TMUX_CONF)

# vim
.PHONY: vim vim-install vim-install-ctags vim-install-plug vim-conf
vim: vim-install vim-install-ctags vim-install-plug vim-conf
vim-install:
	$(call echo_install_title,$@)
	brew install vim --with-luajit
vim-install-ctags:
	$(call echo_install_title,$@)
	brew install ctags
vim-install-plug:
	$(call echo_install_title,$@)
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim-conf:
	$(call echo_conf_title,$@)
	echo "source $(DOT_VIM_CONF)" >>$(VIM_CONF)

# imagemagick
.PHONY: imagemagick iimagemagick@6-install imagemagick@6-conf
imagemagick: imagemagick@6-install imagemagick@6-conf
imagemagick@6-install:
	$(call echo_install_title,$@)
	brew install imagemagick@6  # for rmagick
imagemagick@6-conf:
	$(call echo_conf_title,$@)
	echo 'export PATH="/usr/local/opt/imagemagick@6/bin:$${PATH}"'                                  >$(DOT_IMAGEMAGICK_CONF)
	echo 'export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig:$${PKG_CONFIG_PATH}"' >>$(DOT_IMAGEMAGICK_CONF)

# ffmpeg
.PHONY: ffmpeg
ffmpeg: ffmpeg-install
ffmpeg-install:
	$(call echo_install_title,$@)
	brew install ffmpeg

# asciinema
.PHONY: asciinema
asciinema: asciinema-install
asciinema-install:
	$(call echo_install_title,$@)
	brew install asciinema
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

android-tools-adb:
	#brew cask install android-platform-tools
	brew install lzip

tig:
	brew install tig

jq:
	brew install jq

heroku:
	brew install heroku

postgresql:
	brew install postgresql

neovim:
	brew install neovim

p7zip:
	brew install p7zip

inkscape:
	brew install caskformula/caskformula/inkscape

gtk:
	brew install gtk+

mysql:
	brew install mysql

postgresql:
	brew install postgresql

openssl:
	brew install openssl
