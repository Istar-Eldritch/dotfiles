#!/bin/bash

CURRENT_DIR=`pwd -P`

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

# SETUP PLUGIN LOADERS
echo DOWNLOADING/UPDATING dependencies
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d $HOME/.tmux/plugins/tpm/.git ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    cd ~/.tmux/plugins/tpm
    git pull https://github.com/tmux-plugins/tpm

fi

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

echo PLUGIN LOADERS UPDATED

# LINK CONFIGURATIONS
echo LINKING CONFIGURATIONS...
rm -fr ~/.tmux.conf
ln -s $CURRENT_DIR/.tmux.conf $HOME/.tmux.conf

rm -fr ~/.zshrc
ln -s $CURRENT_DIR/.zshrc $HOME/.zshrc

rm -fr $XDG_CONFIG_HOME/nvim/init.vim
ln -s $CURRENT_DIR/init.vim $XDG_CONFIG_HOME/nvim/init.vim

rm -fr ~/.gitconfig
ln -s $CURRENT_DIR/.gitconfig $HOME/.gitconfig

rm -fr ~/.gitignore_global
ln -s $CURRENT_DIR/.gitignore_global $HOME/.gitignore_global

rm -fr $HOME/.xinitrc
ln -s $CURRENT_DIR/.xinitrc $HOME/.xinitrc

rm -fr $HOME/.xbindkeysrc
ln -s $CURRENT_DIR/.xbindkeysrc $HOME/.xbindkeysrc

rm -fr $HOME/.local/bin
ln -s $CURRENT_DIR/bin $HOME/.local/bin

rm -fr $HOME/.npmrc
ln -s $CURRENT_DIR/.npmrc $HOME/.npmrc

echo CONFIGURATIONS LINKED.
