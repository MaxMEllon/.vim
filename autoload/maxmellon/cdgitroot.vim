function s:base()
  let s:gitroot = system('git rev-parse --show-toplevel')
  let s:gitroot = substitute(s:gitroot, '[\r\n\]', '', 'g')
  return expand(s:gitroot)
endfunction

function! maxmellon#cdgitroot#exec()
  if maxmellon#git#repo#is_inside()
    let s:gitroot = s:base()
    execute 'cd ' . s:gitroot
  else
    echo 'Current directory is not git repository.'
  endif
endfunction

function! maxmellon#cdgitroot#get()
  if maxmellon#git#repo#is_inside()
    let s:gitroot = s:base()
    return s:gitroot
  else
    return ''
  endif
endfunction
