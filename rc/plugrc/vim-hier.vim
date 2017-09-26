command! ClearHighLight call maxmellon#hier#clear()

augroup HierHighlight
  autocmd VimEnter * highlight QFError ctermbg=61
  autocmd VimEnter * highlight QFWarning ctermbg=54
  autocmd VimEnter * highlight QFInfo ctermbg=17
augroup END

nnoremap <silent><C-l> :ClearHighLight<CR>:nohlsearch<CR>
