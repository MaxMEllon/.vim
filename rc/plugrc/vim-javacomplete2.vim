augroup vim-java-complete2
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END

let g:JavaComplete_Home = $HOME . '/.vim/plugged/vim-javacomplete2'

nmap <Leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <Leader>jr <Plug>(JavaComplete-Imports-RemoveUnused)




