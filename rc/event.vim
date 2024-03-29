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

" Autocmd VimEnter * set completeopt-=preview

Autocmd BufRead,BufEnter * let g:branch = ''

Autocmd BufRead,BufEnter *.json set conceallevel=0

Autocmd FileType ruby let b:match_words =
      \ '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:' .
      \ '\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'

Autocmd VimEnter,ColorScheme * highlight SignColumn guibg=#181C24

Autocmd ColorScheme * highlight NormalNC guifg=#404040 guibg=#181C24
Autocmd WinEnter,BufWinEnter * setlocal wincolor=
Autocmd WinLeave * setlocal wincolor=NormalNC

