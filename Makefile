YELLOW = $$(tput setaf 226)
GREEN = $$(tput setaf 46)
RED = $$(tput setaf 196)
RESET = $$(tput sgr0)

ifeq ($(OS),Windows_NT)
	UNAME = Windows
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		UNAME = Linux
	endif
	UNAME ?= Other
endif

install:
	@make $(UNAME)

Linux: alacritty bspwm dunst emacs oh-my-zsh polybar sxhkd zsh
Windows: bash git vim
Other: bash git vim

clean:
	@printf "$(RED)--- clean -----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" -D alacritty
	stow -t "$$HOME" -D bspwm
	stow -t "$$HOME" -D dunst
	stow -t "$$HOME" -D emacs
	stow -t "$$HOME" -D oh-my-zsh
	stow -t "$$HOME" -D polybar
	stow -t "$$HOME" -D sxhkd
	stow -t "$$HOME" -D zsh

alacritty:
	@printf "$(YELLOW)--- alacritty ------------------------------------------\n$(RESET)"
	stow -t "$$HOME" alacritty

bspwm:
	@printf "$(YELLOW)--- bspwm ----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" bspwm

dunst:
	@printf "$(YELLOW)--- dunst ----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" dunst

emacs:
	@printf "$(YELLOW)--- emacs ----------------------------------------------\n$(RESET)"
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	stow -t "$$HOME" emacs

oh-my-zsh:
	@printf "$(YELLOW)--- oh-my-zsh ------------------------------------------\n$(RESET)"
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	cp oh-my-zsh/themes/agnoster.zsh-theme ~/.oh-my-zsh/themes/
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

polybar:
	@printf "$(YELLOW)--- polybar --------------------------------------------\n$(RESET)"
	stow -t "$$HOME" polybar

sxhkd:
	@printf "$(YELLOW)--- sxhkd ----------------------------------------------\n$(RESET)"
	stow -t "$$HOME" sxhkd

zsh:
	@printf "$(YELLOW)--- zsh ------------------------------------------------\n$(RESET)"
	stow -t "$$HOME" zsh
	source "$$HOME/.zshrc"

nuke:
	@printf "$(RED)--- nuking existing files ------------------------------\n$(RESET)"
	rm -rf ~/.config/{alacritty,bspwm,dunst,polybar,sxhkd} ~/.emacs.d ~/.spacemacs ~/.oh-my-zsh ~/.zshrc

.PHONY: alacritty bspwm dunst emacs oh-my-zsh polybar sxhkd zsh clean install nuke Windows Linux Other
