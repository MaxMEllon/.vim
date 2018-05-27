set ambiwidth      =single
set autoread
set autowrite
set background     =dark
set backspace      =indent,eol,start
set breakindent
set breakindentopt =sbr
set cmdheight      =1
set cmdwinheight   =5
set colorcolumn    =80,100
set complete       =t,k,.,kspell,w,b,u,t,i,s
set completeopt    =menu,noinsert,noselect
set cscopetag
set display        =lastline
set fillchars      =vert:\ ,fold:\ ,stl:\ ,stlnc:\ ,diff:-
set foldcolumn     =0
set helplang       =ja
set history        =100
set hlsearch
set incsearch
set laststatus     =0
set lazyredraw
set linespace      =0
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
set number
set pastetoggle    =<F11>
set pumheight      =10
set redrawtime     =5000
set relativenumber
set report         =1
set ruler
set runtimepath   +=~/.vim/help/vimdoc-ja
set scrolloff      =5
set showbreak      =\\
set showmatch
set showtabline    =0
set spelllang      =en,cjk
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

if g:env.termgui
  set termguicolors
endif

" fold
set foldenable
set foldmethod     =marker
set foldcolumn     =0
set foldlevel      =0

" tab
set expandtab
set shiftwidth     =2
set tabstop        =2
set softtabstop    =2
set autoindent
set smartindent
set cindent
set smarttab

" menu
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.sql

" list
set list
if g:env.mac
  set listchars      =eol:$,tab:\ ,trail:_,precedes:<,extends:>,nbsp:%
else
  set listchars      =eol:$,tab:~\ ,trail:_,precedes:<,extends:>,nbsp:%
endif

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
