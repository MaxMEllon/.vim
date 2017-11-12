augroup vim-java-complete2
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END

imap <F5> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)




