function! s:base()
  redir => result
  silent echo system('ls -la | sed -e "1,2d"')
  redir END
  return result
endfunction

function! maxmellon#ls#get()
  return s:base()
endfunction

function! maxmellon#ls#show()
  echo s:base()
endfunction
