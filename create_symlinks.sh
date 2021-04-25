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
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi

ln -fs ${DIR}/.bashrc ${HOME}/.bashrc

echo "Initalizing conda..."
conda init

ln -fs ${DIR}/.gitconfig ${HOME}/.gitconfig
ln -fs ${DIR}/.inputrc ${HOME}/.inputrc
ln -fs ${DIR}/.pylintrc ${HOME}/.pylintrc
ln -fs ${DIR}/.tmux.conf ${HOME}/.tmux.conf
ln -fs ${DIR}/.vimrc ${HOME}/.vimrc
ln -fsn ${DIR}/ftplugin ${HOME}/.vim/ftplugin

echo "Installing vim plugins"
vim +PluginInstall +qall -c ":q"

ln -fs ${DIR}/flake8 ${HOME}/.config/flake8

ln -fs ${DIR}/ssh_rc ${HOME}/.ssh/rc
ln -fs ${DIR}/ssh_config ${HOME}/.ssh/config
