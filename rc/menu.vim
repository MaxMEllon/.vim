if has('clpum')
  set wildmode=popup
  set wildmenu
  set clpumheight=20
  augroup Clpum
    autocmd!
    autocmd ColorScheme * call s:reset_clpum_highlight()
  augroup END
  function! s:reset_clpum_highlight() abort
    highlight clear ClPmenu
    highlight clear ClPmenuSbar
    highlight clear ClPmenuSel
    highlight clear ClPmenuThumb
    highlight link ClPmenu Pmenu
    highlight link ClPmenuSbar PmenuSbar
    highlight link ClPmenuSel PmenuSel
    highlight link ClPmenuThumb PmenuThumb
  endfunction
else
  set wildmenu
  set wildmode =longest:full,full
endif
set wildignore =*.o,*.obj,*~
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
