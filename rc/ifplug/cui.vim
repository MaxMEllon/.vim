if $YCM ==# 'true' && (has('python') || has('python3'))
  Plug 'Valloric/YouCompleteMe'
elseif g:env.vim8 && (has('python') || has('python3'))
  Plug 'maralla/completor.vim'
  " Plug 'Shougo/neomru.vim'
  " Plug 'Shougo/denite.nvim'
  " let g:python3_host_prog = '/Users/maxmellon/.pyenv/shims/python3'
elseif g:env.lua
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif

" PlugBox 'quickrun'
Plug 'haya14busa/incsearch.vim'
