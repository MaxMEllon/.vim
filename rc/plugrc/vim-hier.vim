command! ClearHighLight call maxmellon#hier#clear()

augroup HierHighlight
  autocmd!
  autocmd VimEnter * highlight QFError   cterm=underline
  autocmd VimEnter * highlight QFWarning cterm=underline
  autocmd VimEnter * highlight QFInfo    cterm=underline
augroup END

nnoremap <silent><C-l> :ClearHighLight<CR>:nohlsearch<CR>
