#!/bin/sh

echo "Begin setup..."

## setup tmux
ln -f tmux.conf ~/.tmux.conf

## setup git
ln -f gitconfig ~/.gitconfig

## setup ssh
ln -f sshconfig ~/.ssh/config

## setup vim
cp -f vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
if type nvim &>/dev/null; then
    mkdir -p ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim
    cp -r colors autoload ~/.config/nvim/
    nvim +PlugInstall +qall
elif type vim | grep -v nvim &>/dev/null; then
    cp -r colors autoload ~/.vim/
    vim +PlugInstall +qall
fi

echo "Done!"
