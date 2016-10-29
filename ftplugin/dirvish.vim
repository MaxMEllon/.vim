let s:my_dirvish = {}

function! s:my_dirvish.touch(filename)
  execute 'cd ' . expand('%')
  execute '!touch ' . a:filename
  edit %
endfunction

command! -bar -nargs=? Touch call s:my_dirvish.touch(<q-args>)

function! s:my_dirvish.mkdir(filename)
  execute 'cd ' . expand('%')
  execute '!mkdir ' . a:filename
  edit %
endfunction

command! -bar -nargs=? Mkdir call s:my_dirvish.mkdir(<q-args>)

function! s:my_dirvish.mv(...) abort
  if len(a:000) != 2 | return | endif
  execute 'cd ' . expand('%')
  execute '!mv ' . a:1 . ' ' . a:2
  edit %
endfunction

command! -nargs=* Mv call s:my_dirvish.mv(<f-args>)

nnoremap <buffer> mv :Mv <C-r><C-a> <C-r><C-a>

function! s:my_dirvish.rm(...) abort
  if len(a:000) == 0 | return | endif
  execute 'cd ' . expand('%')
  for s:file in a:000
    execute '!rm ' . s:file
  endfor
  edit %
endfunction

command! -nargs=* Rm call s:my_dirvish.rm(<f-args>)

nnoremap <buffer> rm :Rm <C-r><C-a>
