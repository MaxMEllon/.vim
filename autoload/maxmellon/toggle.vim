function! maxmellon#toggle#option(global, opt)
  if exists('&' . a:opt)
    let l:set = a:global == g:true ? 'set' : 'setlocal'
    execute l:set . ' ' . a:opt . '! ' . a:opt . '?'
  else
    echo 'unkown option' . a:opt
  endif
endfunction
