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

augroup MyVimrc | autocmd! | augroup END

" Wrapper autocmd
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>
command! -nargs=+ -bar MyLoad call maxmellon#myload#exec(<args>)

MyLoad 'env'
MyLoad 'encode'
MyLoad 'opt'

if g:env.cui | MyLoad 'cui' | endif
if g:env.gui | MyLoad 'gui' | endif
if g:env.neo | MyLoad 'neo' | endif

MyLoad 'mapping'
MyLoad 'plug'
MyLoad 'command'
MyLoad 'filetype'
MyLoad 'indent'
MyLoad 'menu'
MyLoad 'event'
MyLoad 'abbrev'
MyLoad 'cmdwin'
MyLoad 'statusline'

PlugConfigAutoLoad

filetype plugin indent on
syntax on

colorscheme default

set secure
