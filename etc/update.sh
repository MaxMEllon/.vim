#!/usr/bin/env bash

source ~/.vim/etc/lib.sh

execute 'cd $HOME/.vim'

execute 'git pull origin master'

execute 'cat $HOME/.vim/.vimrc > $HOME/.config/nvim/init.vim'
