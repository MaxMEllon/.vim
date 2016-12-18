function! maxmellon#fzy#lsopen()
  try
    if executable('fzy')
      let output = system('ls -la | sed -e "1,2d" | fzy')
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

function! maxmellon#fzy#git_ls_files()
  try
    if maxmellon#git#repo#is_inside()
      let output = system('git ls-files | fzy')
    else
      echomsg 'current directory is not git repository.'
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

function! maxmellon#fzy#ghq_list()
  try
    if executable('ghq')
      let output = system('ghq list | fzy')
    else
      echomsg 'current directory is not git repository.'
    endif
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    let repopath = $GHQ_ROOT . '/' . output
    exec 'edit ' . repopath
  endif
endfunction
