Plug 'MaxMEllon/molokai'
Plug 'MaxMEllon/vim-tmng'
Plug 'haya14busa/vim-operator-flashy'
Plug 'osyo-manga/shabadou.vim'
Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/vim-over'
Plug 'osyo-manga/vim-anzu'

Plug 'kana/vim-smartinput'

Plug 'unite-rails'
Plug 'unite-rails-fat'

if has('job') && has('lambda')
  Plug 'maralla/completor.vim'
elseif has('lua')
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif

Plug 'itchyny/lightline.vim'
