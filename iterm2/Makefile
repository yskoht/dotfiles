#!/usr/bin/make -f

.PHONY: scheme
scheme:
	git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git
	@echo "----"
	@echo "Profiles -> Colors -> Import -> schema : Hivacruz"
	@echo "Profiles -> Terminals -> Notifications : Silence bell"
	@echo "General -> Selection : Applications in terminal may access clipboard"

.PHONY: powerline
powerline:
	git clone https://github.com/powerline/fonts.git --depth=1
	(cd fonts && ./install.sh)
	@echo "----"
	@echo "Profiles -> Text -> Font : Noto Mono for Powerline"
