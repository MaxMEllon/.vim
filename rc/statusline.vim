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

function! MyNeomake()
  if !exists('*neomake#statusline#LoclistCounts')
    return ''
  endif

  " Count all the errors, warnings
  let s:total = 0

  for s:v in values(neomake#statusline#LoclistCounts())
    let s:total += s:v
  endfor

  for s:v in items(neomake#statusline#QflistCounts())
    let s:total += s:v
  endfor

  if s:total == 0
    return ''
  endif

  return 'Errors : ' . s:total
endfunction

" left
set statusline=\ %n\                            " buffer number
set statusline+=%w                              " Preview flag
set statusline+=%m                              " Modify flag
set statusline+=%<%t                            " filename
set statusline+=%r                              " Readonly flag
set statusline+=\ %{maxmellon#git#branch#get()} " Branch name

set statusline+=%=                              " separator
set statusline+=%{MyNeomake()}\ \               " Error counts
set statusline+=%y                              " filetype
set statusline+=\ %l\ /\ %L\                    " location
