#!/bin/sh

# Symbolic link
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.screenrc ~/.screenrc

# Install Neobundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Download hybrid
mkdir -p ~/.vim/colors
git clone https://github.com/w0ng/vim-hybrid ~/.vim/vim-hybrid
cp ~/.vim/vim-hybrid/colors/hybrid.vim ~/.vim/colors/

