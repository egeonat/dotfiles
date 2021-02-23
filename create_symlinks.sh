#!/bin/bash

# Bash script to automatically create symlinks from the home directory to the dotfiles

# !!!WARNING!!! THIS SCRIPT WILL OVERWRITE ANY CONFIGURATION FILES THAT ALREADY EXIST

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -f ${DIR}/.bashrc ~/.bashrc
ln -f ${DIR}/.gitconfig ~/.gitconfig
ln -f ${DIR}/.inputrc ~/.inputrc
ln -f ${DIR}/.pylintrc ~/.pylintrc
ln -f ${DIR}/.tmux.conf ~/.tmux.conf
ln -f ${DIR}/.vimrc ~/.vimrc

ln -f ${DIR}/ssh_rc ~/.ssh/rc
ln -f ${DIR}/ssh_config ~/.ssh/config