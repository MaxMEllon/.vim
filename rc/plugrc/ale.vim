let g:ale_linters = {
      \   'javascript': ['prettier'],
      \   'jsx': ['prettier', 'eslint'],
      \   'scss': [],
      \   'sass': [],
      \   'tmng': ['onion'],
      \}
let g:ale_fixers = {
      \   'javascript': [
      \       'prettier'
      \   ],
      \   'scss': [],
      \   'sass': [],
      \}

let g:ale_javascript_prettier_options = '-c ~/.prettierrc.yml'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = 'E'
let g:ale_sign_style_error = 'X'
let g:ale_sign_warning = 'W'
let g:ale_sign_style_warning = 'W'
let g:ale_sign_info = 'I'

augroup ALE_Highlight
  autocmd!
  autocmd VimEnter * highlight ALEError ctermbg=61
  autocmd VimEnter * highlight ALEStyleError ctermbg=61
  autocmd VimEnter * highlight ALEWarning ctermbg=54
  autocmd VimEnter * highlight ALEStyleWarning ctermbg=54
  autocmd VimEnter * highlight ALEInfo ctermbg=17
augroup END

function! s:ale_disable_autofix()
  augroup ALE_Event
    autocmd!
  augroup END
endfunction

command! ALEDisableAutoFixJavaScript call s:ale_disable_autofix()

call AddToggleCommand('ALEToggle')
