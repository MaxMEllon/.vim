if 0 | endif " for tiny vim

" let g:startuptime = reltime()
" augroup vimrc-startuptime
"   autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
"         \| echomsg 'startuptime: ' . reltimestr(g:startuptime)
" augroup END

function! s:myload(...)
  let s:filepath = expand('~/.vim/rc') . '/' . a:1 . '.vim'
  if filereadable(s:filepath)
    if $VIM_DEBUG == 1 | echo "[Debug] MyLoad:\t\t" . s:filepath | endif
    execute 'source ' . s:filepath
  endif
endfunction

command! -nargs=+ -bar MyLoad call s:myload(<args>)

MyLoad 'env'
MyLoad 'command'
MyLoad 'encode'
MyLoad 'opt'
MyLoad 'mapping'
MyLoad 'platform'
MyLoad 'plug'
MyLoad 'filetype'
MyLoad 'indent'
MyLoad 'menu'
MyLoad 'event'
MyLoad 'abbrev'
MyLoad 'cmdwin'
MyLoad 'statusline'
" MyLoad 'tabline'
MyLoad 'misc'

filetype plugin indent on
syntax on

try
  set background=dark
  colorscheme hybrid
catch
  colorscheme default
endtry

set secure
