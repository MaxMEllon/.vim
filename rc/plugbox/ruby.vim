Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}
" Plug 'osyo-manga/vim-monster', {'for' : 'ruby'}
Plug 'AndrewRadev/splitjoin.vim', {
      \'for' : 'ruby',
      \'on': ['SplitjoinJoin', 'SplitjoinSplit']}

if g:env.neo
  Plug 'fishbullet/deoplete-ruby'
endif

if has('ruby') && !g:env.neo
  Plug 'todesking/ruby_hl_lvar.vim', {'for' : 'ruby'}
endif

Lazy 'ruby', 'ruby'
