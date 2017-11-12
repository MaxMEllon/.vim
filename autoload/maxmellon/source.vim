function! maxmellon#source#call(...) abort
  let l:filepath = expand('~/.vim/rc') . '/' . a:1 . '.vim'
  if filereadable(l:filepath)
    execute 'source ' . l:filepath
  endif
endfunction
