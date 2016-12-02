function! maxmellon#runtimepath#show()
  let l:rtp = &runtimepath
  let l:rtp = substitute(l:rtp, ',', '\n', 'g')
  echo l:rtp
  return l:rtp
endfunction
