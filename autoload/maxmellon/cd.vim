function! maxmellon#cd#exec(...)
  if len(a:000) == 0
    lcd %:h
  else
    execute 'lcd ' . a:1
  endif
  pwd
endfunction
