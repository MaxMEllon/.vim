" See: ../../ftplugin/dirvish.vim
" See: https://github.com/MaxMEllon/.vim/blob/master/autoload/maxmellon/dirvish.vim

function! maxmellon#dirvish#touch(filename) abort
  execute 'cd ' . expand('%')
  call system('touch ' . a:filename)
  edit %
endfunction

function! maxmellon#dirvish#mkdir(filename) abort
  execute 'cd ' . expand('%')
  call system('mkdir ' . a:filename)
  edit %
endfunction

function! maxmellon#dirvish#mv(...) abort
  if len(a:000) != 2 | return | endif
  execute 'cd ' . expand('%')
  call system('mv ' . a:1 . ' ' . a:2)
  edit %
endfunction

function! maxmellon#dirvish#rm(...) abort
  if len(a:000) == 0 | return | endif
  execute 'cd ' . expand('%')
  for file in a:000
    let cmd = executable('gomi') ? 'gomi -s' : 'rm -r'
    call system(cmd . ' ' . file)
  endfor
  edit %
endfunction

function! maxmellon#dirvish#rmdir(...) abort
  if len(a:000) == 0 | return | endif
  execute 'cd ' . expand('%')
  for file in a:000
    call system('rmdir ' . file)
  endfor
  edit %
endfunction

function! maxmellon#dirvish#cp(...) abort
  if len(a:000) != 2 | return | endif
  execute 'cd ' . expand('%')
  call system('cp ' . a:1 . ' ' . a:2)
  edit %
endfunction

function! maxmellon#dirvish#cdgitroot() abort
  call maxmellon#cdgitroot#exec()
  let s:output = maxmellon#pwd#get()
  if &filetype ==# 'dirvish'
    execute 'edit ' . s:output
  endif
endfunction
