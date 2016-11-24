if g:env.vim8 && has('python')
  Plug 'maralla/completor.vim'
elseif g:env.lua
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif

Plug 'osyo-manga/vim-watchdogs'
Plug 'thinca/vim-quickrun'
Plug 'miyakogi/vim-quickrun-job'
Plug 'haya14busa/vim-operator-flashy'
Plug 'MaxMEllon/vim-tmng'

MyLoad 'ifplug/javascript'
MyLoad 'ifplug/css'
MyLoad 'ifplug/rails'
MyLoad 'ifplug/html'
