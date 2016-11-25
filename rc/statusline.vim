augroup InsertHook
  autocmd!
  autocmd VimEnter * call s:StatusLine('Init')
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
augroup END

let s:slhlcmd = ''

function! s:StatusLine(mode)
  if a:mode == 'Enter'
    highlight StatusLine ctermfg=red ctermbg=yellow cterm=NONE guifg=red guibg=yellow
  else
    highlight StatusLine ctermfg=white ctermbg=blue cterm=NONE guifg=white guibg=blue
  endif
endfunction

" left
set statusline       =\ "
set statusline+=%n\ \|\ "
set statusline+=%m\ \|\ "
set statusline+=%t\ \|\ "
set statusline+=%r\ \|\ "
set statusline+=%{maxmellon#paste#statusline()}\ \|"
" right
set statusline+=%=
set statusline+=%#StatusLineBranch#\ %{maxmellon#git#branch#get()}\ %#StatusLine#
set statusline+=%#StatusLineFileType#\ %y\ "
set statusline+=%#StatusLineVimType#\ %{maxmellon#vimtype#statusline()}\ "
set statusline+=%#ErrorMsg#%{maxmellon#qf#statusline()}"
