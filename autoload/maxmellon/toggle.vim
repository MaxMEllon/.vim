function! maxmellon#toggle#option(global, opt)
  let l:true = maxmellon#bool#truthy()
  if exists('&' . a:opt)
    let l:set = a:global == l:true ? 'set' : 'setlocal'
    execute l:set . ' ' . a:opt . '! ' . a:opt . '?'
  else
    echo 'unkown option' . a:opt
  endif
endfunction
