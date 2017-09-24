function! maxmellon#path#show()
  let l:path = &runtimepath
  let l:path = substitute($PATH, ':', '\n', 'g')
  echo l:path
  return l:path
endfunction
