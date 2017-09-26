let g:ale_linters = {
      \   'javascript': ['prettier', 'eslint'],
      \   'jsx': ['prettier', 'eslint']
      \}
let g:ale_fixers = {
      \   'javascript': [
      \       'prettier'
      \   ],
      \}

augroup ALE_Highlight
  autocmd!
  autocmd VimEnter * highlight ALEError ctermbg=61
  autocmd VimEnter * highlight ALEStyleError ctermbg=61
  autocmd VimEnter * highlight ALEWarning ctermbg=54
  autocmd VimEnter * highlight ALEStyleWarning ctermbg=54
  autocmd VimEnter * highlight ALEInfo ctermbg=17
augroup END

call AddToggleCommand('ALEToggle')
