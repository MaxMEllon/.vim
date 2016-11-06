Autocmd VimEnter COMMIT_EDITMSG if getline(1) == ''
      \ | execute 1
      \ | startinsert
      \ | endif
Autocmd VimEnter COMMIT_EDITMSG setlocal spell

AutocmdFT html inoremap <silent> <buffer> </ </<C-x><C-o>

AutocmdFT sass,scss,css,stylus setlocal iskeyword+=-

Autocmd BufNewFile,BufRead,VimEnter,WinEnter,ColorScheme
      \ * highlight ZenkakuSpaces term=underline guibg=Blue ctermbg=Blue
Autocmd BufNewFile,BufRead,VimEnter,WinEnter
      \ * syntax match ZenkakuSpaces containedin=ALL /　/

Autocmd InsertLeave * set nopaste

Autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \ | exe "normal g`\"" | endif

Autocmd QuickFixCmdPost make,*grep* cwindow

if has('nvim')
  Autocmd BufRead,BufEnter * if &buftype ==# 'terminal'
        \| setlocal nolist | startinsert | endif
endif

Autocmd BufRead,BufEnter * let g:branch = ''
