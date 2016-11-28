Plug 'MaxMEllon/molokai'
Plug 'MaxMEllon/vim-tmng'
Plug 'haya14busa/vim-operator-flashy'
Plug 'osyo-manga/shabadou.vim'
Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/vim-over'
Plug 'osyo-manga/vim-anzu'

Plug 'unite-rails'
Plug 'unite-rails-fat'

if g:env.vim8 && has('python')
  Plug 'maralla/completor.vim'
elseif g:env.lua
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif

Plug 'itchyny/lightline.vim'

MyLoad 'ifplug/javascript'
