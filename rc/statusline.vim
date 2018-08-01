scriptencoding utf-8

augroup InsertHook
  autocmd!
  autocmd VimEnter * call s:StatusLine('Init')
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
augroup END

function! s:StatusLine(mode)
  highlight StatusLineNC ctermfg=black ctermbg=240  cterm=NONE guifg=black guibg=black
  if a:mode ==# 'Enter'
    highlight StatusLine ctermfg=white ctermbg=196 cterm=NONE guifg=white guibg=darkyellow
  else
    highlight StatusLine ctermfg=27    ctermbg=123 cterm=NONE guifg=white guibg=darkgray
  endif
endfunction

function! WrapedGoStatusLine()
  try
    return go#statusline#Show()
  catch
    return ''
  endtry
endfunction

let s:slhlcmd = ''

" finish

" left
set statusline =\ "
set statusline+=%n\ "
set statusline+=%m\ "
set statusline+=%t\ "
set statusline+=%r\ "
set statusline+=%{maxmellon#paste#statusline()}\ "

" right
set statusline+=%=
" set statusline+=%#StatusLineBranch#\ %{maxmellon#git#branch#get()}\ %#StatusLine#
set statusline+=%#StatusLineFileType#\ %y\ "
" set statusline+=%#StatusLineVimType#\ %{maxmellon#vimtype#statusline()}\ "
" set statusline+=%#StatusLineGoBuild#%{WrapedGoStatusLine()}"
set statusline+=%#ErrorMsg#\ %{maxmellon#qf#statusline()}"

let s:statusline = &statusline
