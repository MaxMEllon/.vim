" Plug 'osyo-manga/vim-monster', {'for' : 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}
Plug 'AndrewRadev/splitjoin.vim', {
      \'for' : 'ruby',
      \'on': ['SplitjoinJoin', 'SplitjoinSplit']}

if has('ruby')
  Plug 'todesking/ruby_hl_lvar.vim', {'for' : 'ruby'}
endif

Lazy '*.rb', 'ruby'
