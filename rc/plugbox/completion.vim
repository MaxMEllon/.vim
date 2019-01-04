if $ASYNC ==# 'true'
  " Depend on async.vim
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-buffer.vim'
  Plug 'prabirshrestha/asyncomplete-file.vim'
  Plug 'prabirshrestha/asyncomplete-flow.vim'
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'prabirshrestha/asyncomplete-lsp.vim'
elseif $YCM ==# 'true' && (has('python') || has('python3'))
  Plug 'Valloric/YouCompleteMe'
elseif g:env.vim8 && (has('python') || has('python3'))
  Plug 'maralla/completor.vim'
elseif g:env.lua
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif
