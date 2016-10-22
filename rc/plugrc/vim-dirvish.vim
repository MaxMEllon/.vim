" See: ../../ftplugin/dirvish.vim
" See: https://github.com/MaxMEllon/.vim/blob/master/ftplugin/dirvish.vim

let g:dirvish_window = -1
function! s:toggle_dirvish()
  if (g:dirvish_window == -1 && &ft != 'dirvish')
    leftabove topleft vsplit .
    let g:dirvish_window = bufwinnr('$')
    wincmd p
  else
    exe g:dirvish_window . 'quit'
    let g:dirvish_window = -1
  endif
endfunction

command! -nargs=0 ToggleDirvish call s:toggle_dirvish()
nnoremap <silent>,n :<C-u> ToggleDirvish<CR>
