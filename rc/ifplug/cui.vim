if has('job') && has('lambda') && has('python')
  Plug 'maralla/completor.vim'
elseif has('lua')
  Plug 'Shougo/neocomplete.vim'
clse
  Plug 'Shougo/neocomplecache.vim'
endif
