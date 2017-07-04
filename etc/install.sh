#!/usr/bin/env bash

source ~/.vim/etc/lib.sh

execute 'ln -fs $HOME/.vim/.vimrc $HOME'

execute 'mkdir -p $HOME/.config/nvim'

execute 'touch $HOME/.config/nvim/init.vim'

execute 'cat $HOME/.vim/.nvimrc > $HOME/.config/nvim/init.vim'

execute 'mkdir -p $HOME/.vim/help'

execute 'git submodule init'
