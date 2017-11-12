" set mouse&
" set mousemodel=extend
" set mouse+=a
" set clipboard=unnamed
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=M
set guioptions-=m
set guioptions-=T
set guioptions-=C
set guioptions-=b
set guioptions-=e
" set imdisable
" set laststatus=2
set cursorline

if g:env.win
  Autocmd VimEnter * let &guifont = 'Ricty_for_Powerline:h14'
else
  Autocmd VimEnter * let &guifont = 'Ubuntu Mono:h14'
  Autocmd VimEnter * let &guifontwide = 'Ubuntu Mono:h14'
endif

Autocmd VimEnter * set lines=60 | set columns=120
