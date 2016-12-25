function! s:get_output(command)
  if !executable('fzy')
    echomsg 'Please Install fzy command'
  endif
  try
    let output = system(a:command . ' | fzy')
  catch /Vim:Interrupt/
  endtry
  redraw!
  return output
endfunction

function! s:callback(vim_command, output)
    execute a:vim_command . ' ' . a:output
endfunction

function! s:base(command, callback)
  let output = s:get_output(a:command)
  redraw!
  if v:shell_error == 0 && !empty(output)
    call s:callback(a:callback, output)
  endif
endfunction

function! maxmellon#fzy#lsopen()
  call s:base('ls -1aF | sed -e "1,2d"', 'tabedit')
endfunction

function! maxmellon#fzy#git_ls_files()
  if maxmellon#git#repo#is_inside()
    let pwd = maxmellon#pwd#get()
    call maxmellon#cdgitroot#force_exec()
    call s:base('git ls-files', 'tabedit')
    execute 'cd ' . pwd
  endif
endfunction

function! maxmellon#fzy#ghq_list()
  if executable('ghq')
    let output = s:get_output('ghq list')
  else
    echomsg 'Please install ghq command'
  endif
  redraw!
  if v:shell_error == 0 && !empty(output)
    if exists('$GHQ_ROOT')
      let repopath = $GHQ_ROOT . '/' . output
    else
      let ghq_root = system('ghq root')
      let repopath = substitute(ghq_root, '[\r\n]', '', 'g') . '/' . output
    endif
    exec 'tabedit ' . repopath
  endif
endfunction
