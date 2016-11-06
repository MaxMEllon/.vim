" See: ../../ftplugin/dirvish.vim
" See: https://github.com/MaxMEllon/.vim/blob/master/autoload/maxmellon/dirvish.vim

function! maxmellon#dirvish#touch(filename) abort
  execute 'cd ' . expand('%')
  execute '!touch ' . a:filename
  edit %
endfunction

function! maxmellon#dirvish#mkdir(filename) abort
  execute 'cd ' . expand('%')
  execute '!mkdir ' . a:filename
  edit %
endfunction

function! maxmellon#dirvish#mv(...) abort
  if len(a:000) != 2 | return | endif
  execute 'cd ' . expand('%')
  execute '!mv ' . a:1 . ' ' . a:2
  edit %
endfunction

function! maxmellon#dirvish#rm(...) abort
  if len(a:000) == 0 | return | endif
  execute 'cd ' . expand('%')
  for s:file in a:000
    execute '!rm ' . s:file
  endfor
  edit %
endfunction

function! maxmellon#dirvish#cdgitroot() abort
  call maxmellon#cdgitroot#exec()
  redir => s:output
  pwd
  redir END
  if &filetype ==# 'dirvish'
    let s:output = substitute(s:output, '[\r\n]', '', 'g')
    execute 'edit ' . s:output
  endif
endfunction
