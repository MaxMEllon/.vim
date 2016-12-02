function! maxmellon#qf#counts()
  let l:total = 0
  if exists('*neomake#statusline#LoclistCounts')
    for l:v in values(neomake#statusline#LoclistCounts())
      let l:total += l:v
    endfor
    for l:v in items(neomake#statusline#QflistCounts())
      let l:total += l:v
    endfor
  else
    let l:qflist = getqflist()
    for l:qfitem in l:qflist
      if l:qfitem.lnum > 0
        let l:total += 1
      endif
    endfor
  endif

  return l:total
endfunction

function! maxmellon#qf#statusline()
  let l:count = maxmellon#qf#counts()
  if l:count == 0
    return ''
  endif
  return ' Qf : ' . l:count . ' '
endfunction
