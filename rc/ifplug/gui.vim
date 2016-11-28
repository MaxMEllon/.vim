Plug 'MaxMEllon/molokai'
Plug 'MaxMEllon/vim-tmng'
Plug 'haya14busa/vim-operator-flashy'
Plug 'osyo-manga/shabadou.vim'
Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/vim-over'
Plug 'osyo-manga/vim-anzu'

if g:env.vim8 && has('python')
  Plug 'maralla/completor.vim'
elseif g:env.lua
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif

Plug 'itchyny/lightline.vim'

MyLoad 'plugbox/javascript'
MyLoad 'plugbox/rails'
