set colorcolumn    =80,100
setglobal ambiwidth      =double
setglobal autoread
setglobal autowrite
setglobal background     =dark
setglobal backspace      =indent,eol,start
setglobal cmdheight      =1
setglobal cmdwinheight   =5
setglobal completeopt    =menuone,longest,preview
setglobal cscopetag
setglobal display        =lastline
setglobal fillchars      =vert:\ ,fold:\ ,stlnc:\ ,diff:-
setglobal foldcolumn     =0
setglobal history        =100
setglobal hlsearch
setglobal laststatus     =0
setglobal lazyredraw
setglobal linespace      =0
setglobal list
setglobal listchars      =eol:$,tab:>\ ,trail:_
setglobal matchpairs    +=<:>
setglobal matchtime      =1
setglobal maxmem         =500000
setglobal maxmempattern  =500000
setglobal maxmemtot      =1000000
setglobal modeline
setglobal modelines      =2
setglobal noequalalways
setglobal noshowcmd
setglobal noshowmatch
setglobal nrformats      =alpha,hex
setglobal pastetoggle    =<F11>
setglobal pumheight      =30
setglobal report         =1
setglobal ruler
setglobal scrolloff      =5
setglobal showtabline    =0
setglobal splitbelow
setglobal splitright
setglobal synmaxcol      =200
setglobal textwidth      =0
setglobal virtualedit    =block
setglobal whichwrap      =b,s,h,l,<,>,[,]

setglobal noswapfile
setglobal directory      =~/.vim/_swap

setglobal backup
setglobal backupdir      =~/.vim/_back

setglobal undolevels     =200
setglobal undodir        =~/.vim/_undo
setglobal undofile

if executable('hw')
  setglobal grepprg=hw\ --no-group\ --no-color
elseif executable('jvgrep')
  setglobal grepprg=jvgrep
else
  setglobal grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
endif

if !isdirectory(expand('~/.vim/_swap'))
  call mkdir(expand('~/.vim/_swap'), 'p')
endif
if !isdirectory(expand('~/.vim/_back'))
  call mkdir(expand('~/.vim/_back'), 'p')
endif

if !isdirectory(expand('~/.vim/_undo'))
  call mkdir(expand('~/.vim/_undo'), 'p')
endif
