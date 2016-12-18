Plug 'vim-jp/vim-cpp', {'for' : ['c', 'cpp']}
Plug 'majutsushi/tagbar', {'for' : ['c', 'cpp']}
if executable('clang')
  Plug 'justmao945/vim-clang', {'for' : ['c', 'cpp']}
endif

Autocmd BufRead,BufEnter *.c,*.cpp,*.cc,*.h call maxmellon#lazy#c#load()
