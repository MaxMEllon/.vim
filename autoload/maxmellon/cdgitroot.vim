function! maxmellon#cdgitroot#exec()
  let s:is_repo = system('git rev-parse --is-inside-work-tree')
  if s:is_repo =~# 'true'
    let s:gitroot = system('git rev-parse --show-toplevel')
    let s:gitroot = substitute(s:gitroot, '\n', '', 'g')
    execute 'cd ' . s:gitroot
  else
    echo 'Current directory is not git repository.'
  endif
endfunction
