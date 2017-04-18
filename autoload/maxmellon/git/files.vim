function! maxmellon#git#files#get() abort
  if maxmellon#git#repo#is_inside() == g:false
    echomsg 'Current directory not a git repository'
    return
  endif

  let pwd = maxmellon#pwd#get()
  call maxmellon#cdgitroot#force_exec()
  let raw = system('git ls-files')
  let raw = substitute(raw, '[\r|\n]', ',', 'g')
  let files = split(raw, ',')
  execute 'cd  ' . pwd
  return files
endfunction
