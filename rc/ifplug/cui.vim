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
Plug 'haya14busa/vim-operator-flashy'
Plug 'MaxMEllon/vim-tmng'
Plug 'cohama/lexima.vim'

Plug 'MaxMEllon/molokai'
Plug 'nobarudo/tender.vim'

MyLoad 'ifplug/javascript'
MyLoad 'ifplug/css'
MyLoad 'ifplug/rails'
