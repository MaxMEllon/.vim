" javascript syntax
Plug 'pangloss/vim-javascript', {'for' : 'javascript' }
" Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim', {'for' : 'javascript' }
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty', {'for' : 'javascript' }

" javascript doc
Plug 'heavenshell/vim-jsdoc', {'for' : 'javascript' }

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
