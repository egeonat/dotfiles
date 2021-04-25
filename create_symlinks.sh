#!/bin/bash

# Bash script to automatically create symlinks from the home directory to the dotfiles

# !!!WARNING!!! THIS SCRIPT WILL OVERWRITE ANY CONFIGURATION FILES THAT ALREADY EXIST

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $USER = "root" ]; then
	echo "Don't run this script as root!"
	exit 1
fi
if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi

ln -f ${DIR}/.bashrc ${HOME}/.bashrc
conda init
ln -f ${DIR}/.gitconfig ${HOME}/.gitconfig
ln -f ${DIR}/.inputrc ${HOME}/.inputrc
ln -f ${DIR}/.pylintrc ${HOME}/.pylintrc
ln -f ${DIR}/.tmux.conf ${HOME}/.tmux.conf
ln -f ${DIR}/.vimrc ${HOME}/.vimrc
ln -fs ${DIR}/ftplugin ${HOME}/.vim/ftplugin

vim +PluginInstall +qall -c ":q"

ln -f ${DIR}/flake8 ${HOME}/.config/flake8

ln -f ${DIR}/ssh_rc ${HOME}/.ssh/rc
ln -f ${DIR}/ssh_config ${HOME}/.ssh/config
