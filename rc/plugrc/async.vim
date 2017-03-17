function! s:lint_fix_callback(...)
  edit!
endfunction

let s:file = 'rc/plugrc/async.vim'
let s:err1 = s:file . ' : Does not exist config file in project root.'
let s:err2 = s:file . ' : Can not execute lint command'

function! s:eslint_fixer() abort
  if !maxmellon#git#repo#is_inside() | return | endif
  let s:rootdir = maxmellon#cdgitroot#get()
  execute 'cd ' . s:rootdir
  if !filereadable('.eslintrc')
    call g:env.debug(s:err1 . ' ' . s:rootdir . '.eslintrc')
    return
  endif

  if !executable('eslint_d')
    call g:env.debug(s:err2)
    return
  endif

  let s:argv = ['eslint_d', '--fix', '--format', 'compact', expand('%')]

  call async#job#start(s:argv, {
        \ 'on_exit': function('s:lint_fix_callback'),
        \})
endfunction

command! EslintAutoFix call s:eslint_fixer()

function! s:esllint_disable_autofix() abort
  augroup Eslint
    autocmd!
  augroup END
endfunction

command! EslintAutoFixDisable call s:esllint_disable_autofix()

augroup Eslint
  autocmd!
  autocmd BufWritePost *.js EslintAutoFix
augroup END

function! s:rubocop_fixer() abort
  if !maxmellon#git#repo#is_inside() | return | endif
  let s:rootdir = maxmellon#cdgitroot#get()
  execute 'cd ' . s:rootdir
  if !filereadable('.rubocop.yml')
    call g:env.debug(s:err1 . ' ' . s:rootdir . '.rubocop.yml')
    return
  endif

  if !executable('rubocop')
    call g:env.debug(s:err2)
  endif

  let s:argv = ['bundle', 'exec', 'rubocop', '-a', expand('%')]

  call async#job#start(s:argv, {
        \ 'on_exit': function('s:lint_fix_callback')
        \})
endfunction

command! RubocopAutoFix call s:rubocop_fixer()
" augroup Rubocop
"   autocmd!
"   autocmd BufLeave *.rb  RubocopAutoFix
" augroup END
