#!/bin/sh

echo "Creating symlink from here to your home directory..."

ln -f vimrc ~/.vimrc
ln -f tmux.conf ~/.tmux.conf
ln -f gitconfig ~/.gitconfig
ln -f sshconfig ~/.ssh/config

mkdir ~/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Done!"
