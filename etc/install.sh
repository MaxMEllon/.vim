#!/usr/bin/env bash

source ~/.vim/etc/lib.sh

execute 'ln -fs $HOME/.vim/.vimrc $HOME'

execute 'mkdir -p $HOME/.config/nvim'

execute 'touch $HOME/.config/nvim/init.vim'

execute 'cat $HOME/.vim/.vimrc > $HOME/.config/nvim/init.vim'
