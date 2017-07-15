if 0 | endif " for tiny vim

" let g:startuptime = reltime()
" augroup vimrc-startuptime
"   autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
"         \| echomsg 'startuptime: ' . reltimestr(g:startuptime)
" augroup END

function! s:myload(...)
  let s:filepath = expand('~/.vim/rc') . '/' . a:1 . '.vim'
  if filereadable(s:filepath)
    if exists('$VIM_DEBUG') | echo "[Debug] Source:\t\t" . s:filepath | endif
    execute 'source ' . s:filepath
  endif
endfunction

command! -nargs=+ -bar Source call s:myload(<args>)

Source 'env'
Source 'command'
Source 'encode'
Source 'opt'
Source 'mapping'
Source 'platform'
Source 'plug'
Source 'filetype'
Source 'indent'
Source 'menu'
Source 'event'
Source 'abbrev'
Source 'cmdwin'
Source 'statusline'
" Source 'tabline'
Source 'misc'

filetype plugin indent on
syntax on

set secure
