function! maxmellon#git#diff#open() abort
  if maxmellon#git#repo#is_inside()
    let diff = system('git diff')
    new ++edit
    setlocal filetype=diff noswapfile noautowrite
    1put! =diff
    if g:env.win
      if isdirectory($TEMP)
        execute 'write! ' . $TEMP . '\Gdiff'
      endif
    else
      write! /tmp/Gdiff
    endif
  endif
endfunction
