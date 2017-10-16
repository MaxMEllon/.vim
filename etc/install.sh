#!/usr/bin/env bash

source ~/.vim/etc/lib.sh

execute 'ln -fs $HOME/.vim/.vimrc $HOME'

execute 'mkdir -p $HOME/.config/nvim'

execute 'touch $HOME/.config/nvim/init.vim'

execute 'cat $HOME/.vim/.nvimrc > $HOME/.config/nvim/init.vim'

execute 'mkdir -p $HOME/.vim/help'

execute 'git submodule init'

if [[ ! -f ~/.vim/.ycm_extra_conf.py ]]; then
  execute 'cp ~/.vim/.ycm_extra_conf.py.example ~/.vim/.ycm_extra_conf.py'
fi
