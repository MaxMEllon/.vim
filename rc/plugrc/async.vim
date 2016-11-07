function! s:eslint_fix_callback(...)
  edit
endfunction

let s:file = 'rc/plugrc/async.vim'
let s:err1 = s:file . ' : Does not exist .eslintrc in project root.'
let s:err2 = s:file . ' : Can not execute eslint_d command'

function! s:eslint_fixer() abort
  if !maxmellon#git#repo#is_inside() | return | endif
  let s:rootdir = maxmellon#cdgitroot#get()
  execute 'cd ' . s:rootdir
  if !filereadable('.eslintrc')
    call g:env.debug(s:err1 . ' ' . s:eslintrc)
    return
  endif

  if !executable('eslint_d')
    call g:env.debug(s:err2)
    return
  endif

  let s:argv = ['eslint_d', '--fix', '--format', 'compact', expand('%')]

  call async#job#start(s:argv, {
        \ 'on_exit': function('s:eslint_fix_callback'),
        \})

endfunction

command! EslintAutoFix call s:eslint_fixer()
augroup Eslint
  autocmd!
  autocmd BufWritePost *.js EslintAutoFix
augroup END
