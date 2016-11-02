function! maxmellon#indent_braces()
  let s:nowletter = getline(".")[col(".")-1]
  let s:beforeletter = getline(".")[col(".")-2]
  if s:nowletter == "}" && s:beforeletter == "{" ||
        \ s:nowletter == "]" && s:beforeletter == "["
    let s:res = "\<C-]>\n\t\n\<UP>\<RIGHT>\<ESC>\A"
  elseif s:beforeletter == ' '
    let s:res = "\<C-]>\n\<ESC>\:call maxmellon#remove_whitespace()\n\ii\<ESC>==xa"
  else
    if pumvisible()
      let s:res = "\<ESC>a"
    else
      let s:res = "\<C-]>\n"
    endif
  endif
  return s:res
endfunction

function! maxmellon#remove_whitespace()
  let l:save_cursor = getpos(".")
  silent! execute ':%s/\s\+$//e'
  call setpos('.', l:save_cursor)
endfunction

function! maxmellon#load_help()
  if isdirectory(expand('~/.vim/help/vimdoc-ja/doc'))
    helptags ~/.vim/help/vimdoc-ja/doc
    set runtimepath+=~/.vim/help/vimdoc-ja
    set helplang=ja
  endif
endfunction

" See: https://github.com/MaxMEllon/.dotfiles/blob/master/bin/google
function! maxmellon#opener(...)
  if executable('google')
    call system("google " . expand(a:1) . ' &>/dev/null 2>&1 &')
  endif
endfunction

function mexmellon#google(...)
  if executable('opener')
    call system("opener " . expand(a:1) . ' &>/dev/null 2>&1 &')
  endif
endfunction

