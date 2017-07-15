" Plug 'vim-jp/vim-cpp', {'for' : ['c', 'cpp']}
" Plug 'majutsushi/tagbar', {'for' : ['c', 'cpp']}
if executable('clang')
  if g:env.neo
    Plug 'zchee/deoplete-clang', {'for' : ['c', 'cpp']}
    if g:env.mac
      let g:deoplete#sources#clang#libclang_path = $CLANG_LIB
      let g:deoplete#sources#clang#clang_header = $CLANG_INCLUDE
    endif
  else
    " Plug 'justmao945/vim-clang', {'for' : ['c', 'cpp']}
  endif
endif

Lazy 'c,cpp,h', 'c'
