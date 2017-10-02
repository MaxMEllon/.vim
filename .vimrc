function! s:source(...)
  let l:filepath = expand('~/.vim/rc') . '/' . a:1 . '.vim'
  if filereadable(l:filepath)
    execute 'source ' . l:filepath
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
" Source 'statusline'
" Source 'tabline'
Source 'misc'

try
  colorscheme hybrid_material
catch
  colorscheme default
endtry

filetype plugin indent on
syntax on

set secure
