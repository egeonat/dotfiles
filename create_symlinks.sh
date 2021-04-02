#!/bin/bash

# Bash script to automatically create symlinks from the home directory to the dotfiles

# !!!WARNING!!! THIS SCRIPT WILL OVERWRITE ANY CONFIGURATION FILES THAT ALREADY EXIST

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $USER = "root" ]; then
	echo "Don't run this script as root!"
	exit 1
fi
if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -f ${DIR}/.bashrc ~/.bashrc
conda init
ln -f ${DIR}/.gitconfig ~/.gitconfig
ln -f ${DIR}/.inputrc ~/.inputrc
ln -f ${DIR}/.pylintrc ~/.pylintrc
ln -f ${DIR}/.tmux.conf ~/.tmux.conf
ln -f ${DIR}/.vimrc ~/.vimrc
vim +PluginInstall +qall -c ":q"

ln -f ${DIR}/flake8 ~/.config/flake8

ln -f ${DIR}/ssh_rc ~/.ssh/rc
ln -f ${DIR}/ssh_config ~/.ssh/config
