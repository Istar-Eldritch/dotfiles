#!/bin/bash


set -e

# ./install_software.sh

CURRENT_DIR=`pwd -P`

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

# SETUP PLUGIN LOADERS
echo DOWNLOADING/UPDATING dependencies
curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d $HOME/.tmux/plugins/tpm/.git ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    cd ~/.tmux/plugins/tpm
    git pull https://github.com/tmux-plugins/tpm

fi

if [ ! -d $HOME/.zplug ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

echo PLUGIN LOADERS UPDATED

mkdir -p $HOME/.vim

mkdir -p $HOME/.local
mkdir -p $HOME/.local/bin

# LINK CONFIGURATIONS
echo LINKING CONFIGURATIONS...

rm -fr $XDG_CONFIG_HOME/nvim/init.vim
rm -fr $XDG_CONFIG_HOME/nvim/init.lua
ln -s $CURRENT_DIR/nvim/init.lua $XDG_CONFIG_HOME/nvim/init.lua

rm -fr $HOME/.vim/custom_cfg
rm -fr $HOME/.vim/configs
rm -fr $XDG_CONFIG_HOME/nvim/configs
ln -s $CURRENT_DIR/nvim/configs $XDG_CONFIG_HOME/nvim/configs

rm -fr $HOME/.vim/thesaurus
ln -s $CURRENT_DIR/thesaurus $HOME/.vim/thesaurus

rm -fr $HOME/.tmux.conf
ln -s $CURRENT_DIR/.tmux.conf $HOME/.tmux.conf

rm -fr $HOME/.zshrc
ln -s $CURRENT_DIR/.zshrc $HOME/.zshrc

rm -fr $HOME/.gitconfig
ln -s $CURRENT_DIR/.gitconfig $HOME/.gitconfig

rm -fr $HOME/.gitignore_global
ln -s $CURRENT_DIR/.gitignore_global $HOME/.gitignore_global

rm -fr $HOME/.npmrc
ln -s $CURRENT_DIR/.npmrc $HOME/.npmrc

mkdir -p $XDG_CONFIG_HOME/alacritty
rm -fr $XDG_CONFIG_HOME/alacritty/alacritty.yml
ln -s $CURRENT_DIR/alacritty.yml $XDG_CONFIG_HOME/alacritty/alacritty.yml

rm -fr $XDG_CONFIG_HOME/zellij
ln -s $CURRENT_DIR/zellij $XDG_CONFIG_HOME/zellij

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  
  rm -fr $XDG_CONFIG_HOME/i3
  ln -s $CURRENT_DIR/i3 $XDG_CONFIG_HOME/i3
  
  rm -fr $HOME/.xinitrc
  ln -s $CURRENT_DIR/.xinitrc $HOME/.xinitrc
  
  rm -fr $HOME/.xbindkeysrc
  ln -s $CURRENT_DIR/.xbindkeysrc $HOME/.xbindkeysrc
  
  rm -fr $HOME/.compton.conf
  ln -s $CURRENT_DIR/.compton.conf $HOME/.compton.conf

  rm -fr $HOME/.local/bin/pbcopy
  ln -s $CURRENT_DIR/bin/pbcopy.sh $HOME/.local/bin/pbcopy

elif [ "$(uname)" == "Darwin" ]; then
  rm -fr $HOME/.local/bin/vpn
  ln -s $CURRENT_DIR/bin/vpn.sh $HOME/.local/bin/vpn
fi

echo CONFIGURATIONS LINKED.

# Update nvim plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
