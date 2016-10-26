#!/usr/bin/env bash

source ~/.vim/etc/lib.sh

execute 'rm -rf ~/.vimrc'

execute 'rm -rf ~/.config/nvim/init.vim'

execute 'mv ~/.vim /tmp/.vim'
