let g:my_dirvish = {}

function! g:my_dirvish.touch(filename)
  execute '!touch ' . a:filename
  edit %
endfunction

function! g:my_dirvish.mkdir(filename)
  execute '!mkdir ' . a:filename
  edit %
endfunction

command! -bar -nargs=? Touch call g:my_dirvish.touch(<q-args>)
command! -bar -nargs=? Mkdir call g:my_dirvish.mkdir(<q-args>)

function! g:my_dirvish.mv(...) abort
  if len(a:000) != 2 | return | endif
  execute '!mv ' . a:1 . ' ' . a:2
  edit %
endfunction

command! -nargs=* Mv call g:my_dirvish.mv(<f-args>)

nnoremap mv :Mv <C-r><C-a> <C-r><C-a>
