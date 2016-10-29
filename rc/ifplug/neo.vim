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

" rails
Plug 'unite-rails'
Plug 'unite-rails-fat'

" text edit
Plug 'AndrewRadev/splitjoin.vim'
Plug 'osyo-manga/vim-over'

" view
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/vim-operator-flashy'

Plug 'slim-template/vim-slim'

MyLoad 'ifplug/javascript'
MyLoad 'ifplug/css'
"
