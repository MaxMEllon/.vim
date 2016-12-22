" Plug 'osyo-manga/vim-monster', {'for' : 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for' : 'ruby', 'on': ['SplitjoinJoin', 'SplitjoinSplit']}
Plug 'AndrewRadev/splitjoin.vim', {'for' : 'ruby'}
if has('ruby')
  Plug 'todesking/ruby_hl_lvar.vim', {'for' : 'ruby'}
endif

Lazy '*.rb', 'ruby'
