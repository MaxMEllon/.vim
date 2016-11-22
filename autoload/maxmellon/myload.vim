function! maxmellon#myload#exec(...)
  let s:filepath = expand('~/.vim/rc') . '/' . a:1 . '.vim'
  if filereadable(s:filepath)
    if $VIM_DEBUG == 1 | echo "[Debug] MyLoad:\t\t" . s:filepath | endif
    execute 'source ' . s:filepath
  endif
endfunction
