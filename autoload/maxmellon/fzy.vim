function! maxmellon#fzy#lsopen()
  try
    if executable('fzy')
      let output = system('ls -l | sed -e "1,2d" | fzy')
    else
      echomsg 'Please install fzy'
    endif
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    let filename = split(output, ' ')
    exec 'edit ' . filename[len(filename) - 1]
  endif
endfunction
