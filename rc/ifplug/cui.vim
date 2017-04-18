if g:env.vim8 && (has('python') || has('python3'))
  Plug 'maralla/completor.vim'
elseif g:env.lua
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif

PlugBox 'quickrun'
