Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}
" Plug 'osyo-manga/vim-monster', {'for' : 'ruby'}
if has('ruby')
  Plug 'todesking/ruby_hl_lvar.vim', {'for' : 'ruby'}
endif

Lazy '*.rb', 'ruby'
