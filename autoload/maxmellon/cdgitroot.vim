function s:base()
  let l:gitroot = system('git rev-parse --show-toplevel')
  let l:gitroot = substitute(l:gitroot, '[\r\n\]', '', 'g')
  return expand(l:gitroot)
endfunction

function! maxmellon#cdgitroot#exec()
  if maxmellon#git#repo#is_inside()
    let l:gitroot = s:base()
    execute 'cd ' . l:gitroot
  else
    echo 'Current directory is not git repository.'
  endif
endfunction

function! maxmellon#cdgitroot#get()
  if maxmellon#git#repo#is_inside()
    let l:gitroot = s:base()
    return l:gitroot
  else
    return ''
  endif
endfunction
