function! maxmellon#qf#counts()
  let l:total = 0

  let l:lllist = getloclist(0)
  for l:loc in l:lllist
    if l:loc.lnum > 0
      let l:total += 1
    endif
  endfor

  let l:qflist = getqflist()
  for l:qfitem in l:qflist
    if l:qfitem.lnum > 0
      let l:total += 1
    endif
  endfor

  return l:total
endfunction

function! maxmellon#qf#statusline()
  let l:count = maxmellon#qf#counts()
  if l:count == 0
    return ''
  endif
  return ' ' . l:count . ' '
endfunction
