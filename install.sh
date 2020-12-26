#!/bin/bash

###
# emacs/spacemacs
###
echo "Setting up emacs/spacemacs..."

# only create the link if it either doesn't exist or is not a link
if ! [[ -e ~/.spacemacs ]] || ! [[ -L ~/.spacemacs ]]; then
    echo " --> linking .spacemacs to home"
    ln -sf $PWD/.spacemacs ~/.spacemacs
else
    echo " --> .spacemacs is already linked!"
fi

echo " --> setting up spacemacs folder (.emacs.d)"
if ! [[ -d $HOME/.emacs.d ]] ; then
    printf "\nNo .emacs.d folder found - downloading spacemacs...\n"
    git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
elif [[ -d ~/.emacs.d ]] && ! [[ -e ~/.emacs.d/spacemacs.mk ]] ; then
    printf "\n --> .emacs.d present, but not spacemacs. Let's get it.\n\n"
    echo " --> renaming .emacs.d to .emacs.d.old"
    mv ~/.emacs.d ~/.emacs.d.OLD
    git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
else
    echo "Spacemacs already present! Skipping download."
fi

###
# zsh
###

echo ; echo "Setting up zsh"

# only create the link if it either doesn't exist or is not a link
if ! [[ -e ~/.zshrc ]] || ! [[ -L ~/.zshrc ]]; then
    echo " --> backing up and linking .zshrc to home"
    cp ~/.zshrc ~/.zshrc.bak 2>/dev/null
    ln -sf $PWD/.zshrc ~/.zshrc
else
    echo " --> .zshrc is already linked!"
fi

echo " --> setting up plugins and linked files..."
echo " --> setting up oh-my-zsh"

if ! [[ -d ~/.oh-my-zsh ]]; then
    echo " --> no oh-my-zsh - cloning..."
    git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
else
    echo " --> oh-my-zsh folder already exists"
fi

echo " --> setting up zsh-syntax-highlighting..."
if ! [[ -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ]]; then
   echo " --> cloning zsh-syntax-highlighting..."
   git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
   echo " --> copying zsh theme customizations..."
   cp oh-my-zsh/themes/agnoster.zsh-theme $HOME/.oh-my-zsh/themes/
else
    echo " --> zsh-syntax-highlighting already installed!"
fi

echo "Adding functions, aliases, and exports..."
echo " --> creating ~/scripts/shell"
mkdir -p ~/scripts/shell

echo " --> linking files..."
ln -sf $PWD/scripts/shell/aliases.sh ~/scripts/shell/aliases.sh
ln -sf $PWD/scripts/shell/functions.sh ~/scripts/shell/functions.sh
ln -sf $PWD/scripts/shell/exports.sh ~/scripts/shell/exports.sh

echo "Sourcing ~/.zshrc"
source ~/.zshrc

###
# bspwm+sxhkd+polybar
###

echo "bspwm - checking for process and installing files..."

# check to see if we're running bspwm and then link files
if [[ `pgrep bspwm` ]] ; then
    echo " --> bspwm found!  installing files."
    mkdir -p ~/.config/{bspwm,sxhkd}
    ln -sf $PWD/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
    ln -sf $PWD/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
    ln -sf $PWD/.config/polybar ~/.config/polybar
else
    echo " --> bspwm not found; skipping this!"
fi

###
# private repo files
###

echo "Checking and installing private repo"

# check for ssh-agent
if ! [[ -d $PWD/private ]] ; then
    if ! [[ `ssh-add -l | grep -i I6M0VOSO7` ]] ; then
        echo " --> ssh key not found in agent, trying to add it"
        sagent
    else
        echo " --> ssh key found in agent; can continue!"
    fi

    if ! [[ `ssh-add -l | grep -i I6M0VOSO7` ]] ; then
        echo " --> prompting for ssh key passowrd:"
        ssh-add
    fi

    if ! [[ `ssh-add -l | grep -i I6M0VOSO7` ]] ; then
        echo " --> still not able to retrieve ssh key; cannot install private repo"
    else
        echo " --> ssh key found, installing private repo"
        git submodule add git@github.com:tobraha/private.git
    fi
else
    echo " --> prviate repo already exists!"
fi

# source private aliasrc
source $HOME/dotfiles/private/aliasrc

echo ; echo "Done!"
