function! maxmellon#toggle#option(global, opt)
  if exists('&' . a:opt)
    let s:set = a:global == g:true ? 'set' : 'setlocal'
    execute s:set . ' ' . a:opt . '! ' . a:opt . '?'
  else
    echo 'unkown option' . a:opt
  endif
endfunction
