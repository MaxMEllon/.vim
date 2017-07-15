function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/denite.nvim'
let g:python3_host_prog = '/Users/maxmellon/.pyenv/shims/python3'

" runner
Plug 'neomake/neomake'
Plug 'thinca/vim-quickrun'

" text edit
" Plug 'osyo-manga/vim-over'

" view
" Plug 'osyo-manga/vim-anzu'
Plug 'nobarudo/tender.vim'
Plug 'MaxMEllon/molokai'

let g:deoplete#enable_at_startup = 1
