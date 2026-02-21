#!/bin/sh

# Symbolic link
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# Install Neobundle
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim

# Download hybrid
mkdir -p ~/.vim/colors
git clone https://github.com/w0ng/vim-hybrid ~/.vim/vim-hybrid
cp ~/.vim/vim-hybrid/colors/hybrid.vim ~/.vim/colors/

# oh-my-zsh
wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/blinks.zsh-theme ~/.oh-my-zsh/themes/
chsh -s /bin/zsh


