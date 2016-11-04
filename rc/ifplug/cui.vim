if has('job') && has('lambda') && has('python')
  Plug 'maralla/completor.vim'
elseif has('lua')
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'Shougo/neocomplecache.vim'
endif

Plug 'osyo-manga/vim-watchdogs'
Plug 'thinca/vim-quickrun'
Plug 'miyakogi/vim-quickrun-job'

MyLoad 'ifplug/javascript'
MyLoad 'ifplug/css'
