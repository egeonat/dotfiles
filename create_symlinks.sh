#!/bin/bash

# Bash script to automatically create symlinks from the home directory to the dotfiles

# !!!WARNING!!! THIS SCRIPT WILL OVERWRITE ANY CONFIGURATION FILES THAT ALREADY EXIST

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $USER = "root" ]; then
	echo "Don't run this script as root!"
	exit 1
fi

if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
	echo "Installing Vundle for vim"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -fs ${DIR}/.bashrc ~/.bashrc
echo "Initalizing conda..."
conda init

ln -fs ${DIR}/.gitconfig ~/.gitconfig
ln -fs ${DIR}/.inputrc ~/.inputrc
ln -fs ${DIR}/.pylintrc ~/.pylintrc
ln -fs ${DIR}/.tmux.conf ~/.tmux.conf
ln -fs ${DIR}/.vimrc ~/.vimrc

echo "Installing vim plugins"
vim +PluginInstall +qall -c ":q"

ln -fs ${DIR}/flake8 ~/.config/flake8

ln -fs ${DIR}/ssh_rc ~/.ssh/rc
ln -fs ${DIR}/ssh_config ~/.ssh/config
