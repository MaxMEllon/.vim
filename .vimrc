" for tiny vim
if 0 | endif

if $VIM_DEBUG == 1 && has('vim_starting') && has('reltime')
  let s:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter *
          \   echomsg 'startuptime: ' . reltimestr(reltime(s:startuptime))
          \ | unlet s:startuptime
  augroup END
endif

" for load plugin
filetype plugin indent off

autocmd!
augroup MyVimrc
  autocmd!
augroup END

" Wrapper autocmd
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>

function! s:my_load(...)
  let s:filepath = expand('~/.vim/rc') . '/' . a:1 . '.vim'
  if filereadable(s:filepath)
    if $VIM_DEBUG == 1 | echo "[Debug] MyLoad:\t\t" . s:filepath | endif
    execute 'source ' . s:filepath
  endif
endfunction

command! -nargs=+ -bar MyLoad call s:my_load(<args>)

MyLoad 'env'
MyLoad 'encode'
MyLoad 'opt'

if g:env.cui == g:true | MyLoad 'cui' | endif
if g:env.gui == g:true | MyLoad 'gui' | endif
if g:env.neo == g:true | MyLoad 'neo' | endif

MyLoad 'mapping'
MyLoad 'plug'
MyLoad 'command'
MyLoad 'filetype'
MyLoad 'indent'
MyLoad 'menu'
MyLoad 'event'
MyLoad 'abbrev'
MyLoad 'statusline'

PlugConfigAutoLoad

filetype plugin indent on
syntax on

if g:env.gui == g:true
  colorscheme molokai
else
  colorscheme default
endif

set secure
