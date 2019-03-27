let g:ale_linters = {
      \   'javascript': ['flow', 'eslint'],
      \   'ruby': ['rubocop'],
      \   'scss': [],
      \   'sass': [],
      \   'vim': [],
      \}
let g:ale_fixers = {
      \   'javascript': ['prettier'],
      \   'ruby': [],
      \   'scss': [],
      \   'sass': [],
      \}

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_virtualtext_cursor = 1

" augroup ALE_Highlight
"   autocmd!
"   autocmd VimEnter * highlight ALEError ctermbg=61
"   autocmd VimEnter * highlight ALEStyleError ctermbg=61
"   autocmd VimEnter * highlight ALEWarning ctermbg=54
"   autocmd VimEnter * highlight ALEStyleWarning ctermbg=54
"   autocmd VimEnter * highlight ALEInfo ctermbg=17
" augroup END

call AddToggleCommand('ALEToggle')
