function! maxmellon#runtimepath#show()
  let s:rtp = &runtimepath
  let s:rtp = substitute(s:rtp, ',', '\n', 'g')
  echo s:rtp
  return s:rtp
endfunction
