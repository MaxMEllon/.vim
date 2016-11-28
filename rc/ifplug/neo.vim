function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-clang'
Plug 'landaire/deoplete-swift'

" terminal
Plug 'kassio/neoterm'

" runner
Plug 'neomake/neomake'
Plug 'thinca/vim-quickrun'

" text edit
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'osyo-manga/vim-over'

" view
Plug 'osyo-manga/vim-anzu'
Plug 'nobarudo/tender.vim'
Plug 'MaxMEllon/molokai'

MyLoad 'plugbox/javascript'
MyLoad 'plugbox/css'
