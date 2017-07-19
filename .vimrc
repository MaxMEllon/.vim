if 0 | endif " for tiny vim

" let g:startuptime = reltime()
" augroup vimrc-startuptime
"   autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
"         \| echomsg 'startuptime: ' . reltimestr(g:startuptime)
" augroup END

function! s:source(...)
  let filepath = expand('~/.vim/rc') . '/' . a:1 . '.vim'
  if filereadable(filepath)
    if exists('$VIM_DEBUG') | echo "[Debug] Source:\t\t" . filepath | endif
    execute 'source ' . filepath
  endif
endfunction

command! -nargs=+ -bar Source call s:source(<args>)

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
