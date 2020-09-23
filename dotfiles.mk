#!/usr/bin/make -f
DOT := $(HOME)/.dotfiles

ZSH_CONF  := $(HOME)/.zshrc
GIT_CONF  := $(HOME)/.gitconfig
TMUX_CONF := $(HOME)/.tmux.conf
VIM_CONF  := $(HOME)/.vimrc

DOT_ZSH       := $(DOT)/zsh
DOT_VIM       := $(DOT)/vim
DOT_MAC       := $(DOT)/mac
DOT_KARABINER := $(DOT)/karabiner

DOT_ZSH_CONF   := $(DOT_ZSH)/zshrc
DOT_GIT_CONF   := $(DOT)/gitconfig
DOT_TMUX_CONF  := $(DOT)/tmux.conf
DOT_VIM_CONF   := $(DOT_VIM)/vimrc

message = "\n$1$1 $2 $1$1"
echo_install_title = @echo $(call message,⚡️,$1)
echo_conf_title    = @echo $(call message,✍️ ,$1)
echo_sudo_title    = @echo $(call message,❗️,$1)
echo_setup_title   = @echo $(call message,⚙ ,$1)
echo_other_title   = @echo $(call message,☘ ,$1)
echo_message       = @echo $(call message,🙇,$1)

all_target   := $(shell cat $(DOT)/dotfiles.mk | ruby -ne '$$_.match(/^([^\-\s\.]*):.*$$/){|m| puts m[1]}')

.PHONY: help
help:
	@echo "./dotfiles.mk [stuff-[install|setup|conf]]"
	@echo "  [stuff] $(all_target)"

# brew
.PHONY: brew-install brew-bundle
brew-install:
	$(call echo_install_title,$@)
	if !(type "brew" > /dev/null 2>&1); then\
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";\
	fi
	brew update
brew-bundle: brew-install
	brew bundle

# mac
.PHONY: mac-setup
mac-setup:
	$(call echo_setup_title,$@)
	sh $(DOT_MAC)/setup_mac.sh
mac-name:
	$(call echo_setup_title,$@)
	sh $(DOT_MAC)/computer_name.sh

# karabiner
.PHONY: karabiner-conf
karabiner-conf:
	$(call echo_conf_title,$@)
	ln -s $(DOT_KARABINER)/karabiner.json ~/.config/karabiner/karabiner.json

# iTems2 theme
.PHONY: iterm-theme-install
iterm-theme-install:
	$(call echo_install_title,$@)
	git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git
	$(call echo_message,"Profiles -> Colors -> Import -> schema : Hivacruz")
	$(call echo_message,"Profiles -> Terminals -> Notifications : Silence bell")
	$(call echo_message,"General -> Selection : Applications in terminal may access clipboard")

# powerline
.PHONY: powerline
powerline:
	$(call echo_install_title,$@)
	git clone https://github.com/powerline/fonts.git --depth=1
	(cd fonts && ./install.sh)
	rm -rf fonts
	$(call echo_message,"Profiles -> Text -> Font : Noto Mono for Powerline")

# zsh
.PHONY: zsh-conf zsh-git-prompt
zsh-conf:
	$(call echo_conf_title,$@)
	echo "source $(DOT_ZSH_CONF)" >>$(ZSH_CONF)
zsh-git-prompt:
	$(call echo_install_title,$@)
	git clone https://github.com/olivierverdier/zsh-git-prompt.git $(DOT_ZSH)/zsh-git-prompt

# git
.PHONY: git-conf
git-conf:
	$(call echo_install_title,$@)
	echo "[include]\n\tpath = $(DOT_GIT_CONF)" >>$(GIT_CONF)

# anyenv
.PHONY: anyenv-setup
anyenv-setup:
	$(call echo_setup_title,$@)
	$(call echo_message,"anyenv init")
	$(call echo_message,"anyenv install --init")
anyenv-install-env:
	$(call echo_install_title,$@)
	anyenv install rbenv
	anyenv install pyenv
	anyenv install nodenv
	anyenv install jenv
	exec $$SHELL -l
anyenv-install:
	$(call echo_install_title,$@)
	rbenv install 2.7.1
	rbenv global 2.7.1
	pyenv install 3.8.3
	pyenv global 3.8.3
	nodenv install 14.4.0
	nodenv global 14.4.0
	jenv add $$(/usr/libexec/java_home)

# tmux
.PHONY: tmux-conf tmux-plugin-manager
tmux-conf:
	$(call echo_conf_title,$@)
	echo "source-file $(DOT_TMUX_CONF)" >>$(TMUX_CONF)
tmux-plugin-manager:
	$(call echo_install_title,$@)
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	$(call echo_message,"Press prefix + 'I'")

# vim
.PHONY: vim-install-plug vim-conf
vim-install-plug:
	$(call echo_install_title,$@)
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	$(call echo_message,type ":PlugInstall" in vim console after vim-install-plug)
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

.PHONY: react-native-debugger-0.10
react-native-debugger-0.10: react-native-debugger-0.10-install
react-native-debugger-0.10-install:
	$(call echo_install_title,$@)
	brew update && brew cask install https://raw.githubusercontent.com/Homebrew/homebrew-cask/b6ac3795c1df9f97242481c0817b1165e3e6306a/Casks/react-native-debugger.rb

