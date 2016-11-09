function! s:base()
  redir => s:dir
  pwd
  redir END
  let s:dir = substitute(s:dir, '[\r\n]', '', 'g')
  return s:dir
endfunction

function! maxmellon#pwd#get()
  return s:base()
endfunction

function! maxmellon#pwd#show()
  echo s:base()
endfunction
