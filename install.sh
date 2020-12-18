#!/bin/bash

# emacs/spacemacs
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
    printf "\n.emacs.d present, but not spacemacs. Let's get it.\n\n"
    echo " --> renaming .emacs.d to .emacs.d.old"
    mv ~/.emacs.d ~/.emacs.d.OLD
    git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
else
    echo "Spacemacs already present! Skipping download."
fi

# zsh
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

echo ; echo "Done!"
