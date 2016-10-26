let g:hi_insert = 'highlight StatusLine ctermfg=red ctermbg=yellow cterm=NONE guifg=red guibg=yellow'
let g:hi_normal = 'highlight StatusLine ctermfg=white ctermbg=blue cterm=NONE guifg=white guibg=blue'
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
    silent exec g:hi_insert
  else
    silent exec g:hi_normal
  endif
endfunction

function! s:GetHighlight(hi)
  redir => s:hl
  exec 'highlight ' . a:hi
  redir END
  let s:hl = substitute(s:hl, '[\r\n]', '', 'g')
  let s:hl = substitute(s:hl, 'xxx', '', '')
  return s:hl
endfunction

let s:branch = ''
function! GetBranch()
  if !empty(s:branch) | return s:branch | endif
  let s:is_repo = system('git rev-parse --is-inside-work-tree')
  if s:is_repo =~# 'true'
    let s:branch = system('git branch | grep "*" | tr -d "*" | tr -d " "')
    let s:branch = substitute(s:branch, '\n', '', 'g')
  else
    let s:branch = 'X'
  endif
  return s:branch
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
set statusline=\ %n\               " buffer number
set statusline+=\|                 " |
set statusline+=%w                 " Preview flag
set statusline+=\|                 " |
set statusline+=%m                 " Modify flag
set statusline+=\|                 " |
set statusline+=%<%t               " filename
set statusline+=\|                 " |
set statusline+=%r                 " Readonly flag
set statusline+=\|                 " |
set statusline+=%{GetBranch()}     " Branch name
set statusline+=\|                 " |
" right                            " |
set statusline+=%=                 " separator
set statusline+=%{MyNeomake()}\ \  " Error counts
set statusline+=\|                 " |
set statusline+=%y                 " filetype
set statusline+=\|                 " |
set statusline+=\ %l\ /\ %L\       " location

