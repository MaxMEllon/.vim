function! maxmellon#error#counts()
  if exists('*neomake#statusline#LoclistCounts')
    let s:total = 0
    for s:v in values(neomake#statusline#LoclistCounts())
      let s:total += s:v
    endfor
    for s:v in items(neomake#statusline#QflistCounts())
      let s:total += s:v
    endfor
  else
    let s:total = len(getqflist())
  endif

  return s:total
endfunction

function! maxmellon#error#statusline()
  let s:count = maxmellon#error#counts()
  if s:count == 0
    return ''
  endif
  return ' Errors : ' . s:count . ' '
endfunction
