if exists('b:did_ftplugin_typescript')
  finish
endif

let b:did_ftplugin_typescript = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
" let g:TSS = ['tss', '--module', 'commonjs']

autocmd BufEnter * highlight! typescriptVariableDeclaration ctermfg=228 guifg=#f9ff9f

" set omnifunc=TSScompleteFunc
" set makeprg=tsc
