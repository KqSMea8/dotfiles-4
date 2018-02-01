#!/bin/sh

topdir=$(cd "$( dirname "$0" )" && pwd)
pushd "${topdir}" &> /dev/null

echo "Begin setup..."

## setup git
ln -sf "${topdir}/gitconfig" ~/.gitconfig

## setup ssh
ln -sf "${topdir}/sshconfig" ~/.ssh/config

## setup tmux
ln -sf "${topdir}/tmux.conf" ~/.tmux.conf
mkdir -p ~/.tmux
cp -r tmux/* ~/.tmux/

## setup vim
ln -sf "${topdir}/vimrc" ~/.vimrc
mkdir -p ~/.vim/favorites

if type nvim &>/dev/null; then
    mkdir -p ~/.config/nvim
    ln -sf "${topdir}/vimrc" ~/.config/nvim/init.vim
    cp -r vim/* ~/.config/nvim/
    nvim +PlugInstall +qall
elif type vim | grep -v nvim &>/dev/null; then
    cp -r vim/* ~/.vim/
    vim +PlugInstall +qall
fi

echo "Done!"
popd &> /dev/null
