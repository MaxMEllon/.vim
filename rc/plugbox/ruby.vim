" Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}
Plug 'AndrewRadev/splitjoin.vim', {
      \'for' : 'ruby',
      \'on': ['SplitjoinJoin', 'SplitjoinSplit']}

" if g:env.neo
  " Plug 'fishbullet/deoplete-ruby'
  " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" endif

" if has('ruby') && !g:env.neo
  " Plug 'todesking/ruby_hl_lvar.vim', {'for' : 'ruby'}
" endif

" Plug 'osyo-manga/vim-monster', {'for' : 'ruby'} | Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Lazy 'ruby'

let g:monster#completion#rcodetools#backend = "async_rct_complete"
