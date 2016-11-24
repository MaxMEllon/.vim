set autoread
set ambiwidth=double
set autowrite
set background     =dark
set backspace      =indent,eol,start
set cmdheight      =1
set cmdwinheight   =5
set completeopt    =menuone,longest,preview
set cscopetag
set cursorline
set display        =lastline
set fillchars      =vert:\|,fold:\-
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

set noswapfile
set nobackup
set directory      =~/.vim/_swap
set backupdir      =~/.vim/_undo

set grepprg        =hw\ --no-group\ --no-color

set undodir        =~/.vim/_undo
set undofile
set undolevels     =200

if exists('+colorcolumn')
  set colorcolumn  =80,100
endif

if !isdirectory(expand('~/.vim/_swap'))
  call mkdir(expand('~/.vim/_swap'), 'p')
endif

if !isdirectory(expand('~/.vim/_undo'))
  call mkdir(expand('~/.vim/_undo'), 'p')
endif
