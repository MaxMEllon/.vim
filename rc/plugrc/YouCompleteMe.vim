let g:ycm_collect_identifiers_from_tags_files = 1
AutocmdFT javascript nnoremap ,gd :<C-u>YcmCompleter GetDoc<CR>
AutocmdFT javascript nnoremap ,gt :<C-u>YcmCompleter GoTo<CR>
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
Autocmd BufEnter * set completeopt-=preview
