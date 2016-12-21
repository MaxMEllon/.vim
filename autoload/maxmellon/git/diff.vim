function! maxmellon#git#diff#open() abort
  if maxmellon#git#repo#is_inside()
    let diff = system('git diff')
    new ++edit
    setlocal filetype=diff noswapfile noautowrite
    1put! =diff
    write! /tmp/Gdiff
  endif
endfunction
