Autocmd VimEnter COMMIT_EDITMSG if getline(1) == ''
      \ | execute 1
      \ | startinsert
      \ | endif
Autocmd VimEnter COMMIT_EDITMSG setlocal spell

AutocmdFT html inoremap <silent> <buffer> </ </<C-x><C-o>

AutocmdFT sass,scss,css,stylus setlocal iskeyword+=-

Autocmd InsertLeave * set nopaste

Autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \ | exe "normal g`\"" | endif

Autocmd QuickFixCmdPost make,*grep* cwindow

if g:env.neo
  Autocmd BufRead,BufEnter * if &buftype ==# 'terminal'
        \| setlocal nolist | startinsert | endif
endif

" for tern and vim-clang
Autocmd VimEnter * set completeopt-=preview

Autocmd BufRead,BufEnter * let g:branch = ''

Autocmd BufRead,BufEnter *.json set conceallevel=0

Autocmd FileType ruby let b:match_words =
      \ '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:' .
      \ '\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
