" javascript syntax
Plug 'pangloss/vim-javascript', {'for' : 'javascript' }
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim', {'for' : 'javascript' }
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty', {'for' : 'javascript' }
Plug 'ternjs/tern_for_vim', {'do' : 'npm i', 'for' : 'javascript'}

" javascript doc
Plug 'heavenshell/vim-jsdoc', {'for' : 'javascript', 'on' : 'JsDoc'}

" javascript utility
Plug 'samuelsimoes/vim-jsx-utils', {'for' : 'javascript'}
Plug 'moll/vim-node', {'for' : 'javascript' }

" altjs
Plug 'leafgarland/typescript-vim', {'for' : 'typescript'}
Plug 'kchmck/vim-coffee-script', {'for' : 'coffee'}
Plug 'mtscout6/vim-cjsx', {'for' : 'coffee'}

" other
Plug 'rhysd/npm-debug-log.vim'
Plug 'elzr/vim-json', {'for' : 'json'}

Lazy '*.js,*.jsx', 'javascript'
