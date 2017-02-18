function! maxmellon#highlight#get(group_name)
  redir => hl
  exec 'silent highlight ' . a:group_name
  redir END
  let hl = substitute(hl, '[\r|\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
