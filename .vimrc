if 0 | endif " for tiny vim

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

PlugConfigAutoLoad

filetype plugin indent on
syntax on

set secure
