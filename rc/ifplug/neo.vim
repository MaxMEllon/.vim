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

" Plugin for javascript {{{1
" javascript stntax
Plug 'pangloss/vim-javascript'
LocalPlug 'vim-jsx-pretty'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'

" javascript doc
Plug 'heavenshell/vim-jsdoc'

" javascript utility
Plug 'samuelsimoes/vim-jsx-utils'
Plug 'moll/vim-node'

" altjs
Plug 'leafgarland/typescript-vim', {'for' : 'typescript'}
Plug 'kchmck/vim-coffee-script', {'for' : 'coffee'}
Plug 'mtscout6/vim-cjsx', {'for' : 'coffee'}

" other
Plug 'rhysd/npm-debug-log.vim'
Plug 'elzr/vim-json', {'for' : 'json'}
" }}}
"
" Plugin for css {{{
Plug 'wavded/vim-stylus', {'for' : 'stylus'}
Plug 'groenewege/vim-less', {'for' : 'less'}
Plug 'AtsushiM/sass-compile.vim', {'for' : 'sass'}
Plug 'ap/vim-css-color'
" }}}
