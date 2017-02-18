function! s:base()
  redir => l:dir
  pwd
  redir END
  let l:dir = substitute(l:dir, '[\r|\n]', '', 'g')
  return l:dir
endfunction

function! maxmellon#pwd#get()
  return s:base()
endfunction

function! maxmellon#pwd#show()
  echo s:base()
endfunction
