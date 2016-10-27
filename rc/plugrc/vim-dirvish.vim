" See: ../../ftplugin/dirvish.vim
" See: https://github.com/MaxMEllon/.vim/blob/master/ftplugin/dirvish.vim

let s:dirvish_window = -1
function! s:open_dirvish()
  if s:dirvish_window == -1 && &ft != 'dirvish'
    topleft split .
    let s:dirvish_window = winnr('$')
  endif
endfunction

command! OpenDirvish call s:open_dirvish()

nnoremap <silent>,n :<C-u> OpenDirvish<CR>
