if g:env.vim8 && has('python')
  Plug 'maralla/completor.vim'
elseif g:env.lua
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif

MyLoad 'plugbox/javascript'
MyLoad 'plugbox/css'
MyLoad 'plugbox/rails'
MyLoad 'plugbox/html'
MyLoad 'plugbox/quickrun'
MyLoad 'plugbox/elixir'
