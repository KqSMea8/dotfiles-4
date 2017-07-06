#!/bin/sh

echo "Begin setup..."

## setup tmux
ln -f tmux.conf ~/.tmux.conf

## setup git
ln -f gitconfig ~/.gitconfig

## setup ssh
ln -f sshconfig ~/.ssh/config

## setup vim
if type nvim &>/dev/null; then
    mkdir -p ~/.config
    cp -r nvim ~/.config/
    nvim -c 'PlugInstall' -c ':qa'

elif type vim | grep -v nvim &>/dev/null; then
    mkdir -p ~/.vim
    cp -r vim/* ~/.vim/
    mkdir -p ~/.vim/bundle
    if [ ! -d ~/.vim/bundle/vundle ]; then
        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle
    fi
    vim -c 'PluginInstall' -c ':qa'
fi

echo "Done!"
