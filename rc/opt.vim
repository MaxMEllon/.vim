set ambiwidth      =single
set autoread
set autowrite
set backspace      =indent,eol,start
set cmdheight      =1
set cmdwinheight   =5
set colorcolumn    =80,100
set complete       =.,k,w,b,u,t,i
set completeopt    =menuone,longest,noselect
set cscopetag
set display        =lastline
set fillchars      =vert:\ ,fold:\ ,stlnc:\ ,diff:-
set foldcolumn     =0
set helplang       =ja
set history        =100
set hlsearch
set incsearch
set laststatus     =0
set lazyredraw
set linespace      =0
set list
set listchars      =eol:$,tab:~\ ,trail:_,precedes:<,extends:>,nbsp:%
set matchpairs     =<:>,(:),[:],{:}
set matchtime      =4
set maxmem         =500000
set maxmempattern  =500000
set maxmemtot      =1000000
set modeline
set modelines      =2
set noequalalways
set noshowcmd
set nrformats      =alpha,hex
set pastetoggle    =<F11>
set pumheight      =10
set redrawtime     =5000
set report         =1
set ruler
set runtimepath   +=~/.vim/help/vimdoc-ja
set scrolloff      =5
set showmatch
set showtabline    =0
set splitbelow
set splitright
set switchbuf      =useopen
set synmaxcol      =200
set textwidth      =0
set virtualedit    =block
set whichwrap      =b,s,h,l,<,>,[,]

set noswapfile
set directory      =~/.vim/_swap

set backup
set backupdir      =~/.vim/_back

set undolevels     =200
set undodir        =~/.vim/_undo
set undofile

" fold
set foldenable
set foldmethod =marker
set foldcolumn =0
set foldlevel  =0

" tab
set expandtab
set shiftwidth  =2
set tabstop     =2
set softtabstop =2
set autoindent
set smartindent
set cindent
set smarttab

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
