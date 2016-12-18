set ambiwidth      =double
set autoread
set autowrite
set background     =dark
set backspace      =indent,eol,start
set cmdheight      =1
set cmdwinheight   =5
set colorcolumn    =80,100
set completeopt    =menuone,longest,preview
set cscopetag
set cursorline
set display        =lastline
set fillchars      =vert:\ ,fold:\ ,stlnc:\ ,diff:-
set grepprg        =hw\ --no-group\ --no-color
set history        =100
set hlsearch
set laststatus     =2
set lazyredraw
set linespace      =0
set list
set listchars      =eol:$,tab:>\ ,trail:_
set matchpairs    +=<:>
set matchtime      =1
set maxmem         =500000
set maxmempattern  =500000
set maxmemtot      =1000000
set modeline
set modelines      =2
set noequalalways
set noshowcmd
set nrformats      =alpha,hex
set pastetoggle    =<F11>
set pumheight      =30
set report         =1
set ruler
set scrolloff      =100
set showmatch
set splitbelow
set splitright
set synmaxcol      =140
set textwidth      =0
set virtualedit    =block
set whichwrap      =b,s,h,l,<,>,[,]

set swapfile
set directory      =~/.vim/_swap

set backup
set backupdir      =~/.vim/_back

set undolevels     =200
set undodir        =~/.vim/_undo
set undofile

if executable('hw')
  set grepprg=hw\ --no-group\ --no-color
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
