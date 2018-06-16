let g:ale_linters = {
      \   'javascript': ['flow', 'eslint'],
      \   'ruby': ['rubocop'],
      \   'scss': [],
      \   'sass': [],
      \   'vim': [],
      \}
let g:ale_fixers = {
      \   'javascript': ['prettier_eslint'],
      \   'ruby': [],
      \   'scss': [],
      \   'sass': [],
      \}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = 'E'
let g:ale_sign_style_error = 'X'
let g:ale_sign_warning = 'W'
let g:ale_sign_style_warning = 'W'
let g:ale_sign_info = 'I'
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 0

" augroup ALE_Highlight
"   autocmd!
"   autocmd VimEnter * highlight ALEError ctermbg=61
"   autocmd VimEnter * highlight ALEStyleError ctermbg=61
"   autocmd VimEnter * highlight ALEWarning ctermbg=54
"   autocmd VimEnter * highlight ALEStyleWarning ctermbg=54
"   autocmd VimEnter * highlight ALEInfo ctermbg=17
" augroup END

call AddToggleCommand('ALEToggle')
