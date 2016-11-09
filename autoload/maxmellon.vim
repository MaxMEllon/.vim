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

function maxmellon#google(...)
  if executable('opener')
    call system("opener " . expand(a:1) . ' &>/dev/null 2>&1 &')
  endif
endfunction

function! s:get_syn_id(transparent)
  let s:synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(s:synid)
  else
    return s:synid
  endif
endfunction

function! s:get_syn_attr(synid)
  let s:name = synIDattr(a:synid, "name")
  let s:ctermfg = synIDattr(a:synid, "fg", "cterm")
  let s:ctermbg = synIDattr(a:synid, "bg", "cterm")
  let s:guifg = synIDattr(a:synid, "fg", "gui")
  let s:guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": s:name,
        \ "ctermfg": s:ctermfg,
        \ "ctermbg": s:ctermbg,
        \ "guifg": s:guifg,
        \ "guibg": s:guibg}
endfunction

function maxmellon#syntax_info()
  let s:baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . s:baseSyn.name .
        \ " ctermfg: " . s:baseSyn.ctermfg .
        \ " ctermbg: " . s:baseSyn.ctermbg .
        \ " guifg: " . s:baseSyn.guifg .
        \ " guibg: " . s:baseSyn.guibg
  let s:linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . s:linkedSyn.name .
        \ " ctermfg: " . s:linkedSyn.ctermfg .
        \ " ctermbg: " . s:linkedSyn.ctermbg .
        \ " guifg: " . s:linkedSyn.guifg .
        \ " guibg: " . s:linkedSyn.guibg
endfunction

