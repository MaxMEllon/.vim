if has('syntax') && !has('gui_running')
  augroup InsertHook
    autocmd!
    autocmd VimEnter * call s:StatusLine('Init')
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''

function! s:StatusLine(mode)
  if has('gui_running') | return | endif
  if a:mode == 'Enter'
    highlight StatusLine ctermfg=red ctermbg=yellow cterm=NONE guifg=red guibg=yellow
  else
    highlight StatusLine ctermfg=white ctermbg=blue cterm=NONE guifg=white guibg=blue
  endif
endfunction

" left
set statusline=\ %n\ "
set statusline+=%w
set statusline+=%m
set statusline+=%<%t
set statusline+=%r
set statusline+=\ %{maxmellon#git#branch#get()}

set statusline+=%=
set statusline+=%y
set statusline+=\ %l\ /\ %L\ "
set statusline+=%#ErrorMsg#%{maxmellon#error#statusline()}"
