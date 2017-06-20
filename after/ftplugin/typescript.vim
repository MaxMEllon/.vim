if exists('b:did_ftplugin_typescript')
  finish
endif

let b:did_ftplugin_typescript = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
" let g:TSS = ['tss', '--module', 'commonjs']

" set omnifunc=TSScompleteFunc
" set makeprg=tsc
