function! maxmellon#indent_braces()
  let l:nowletter = getline(".")[col(".")-1]
  let l:beforeletter = getline(".")[col(".")-2]
  if l:nowletter == "}" && l:beforeletter == "{" ||
        \ l:nowletter == "]" && l:beforeletter == "["
    let l:res = "\<C-]>\n\t\n\<UP>\<RIGHT>\<ESC>\A"
  elseif l:beforeletter == ' '
    let l:res = "\<C-]>\n\<ESC>\:call maxmellon#remove_whitespace()\n\ii\<ESC>==xa"
  else
    if pumvisible()
      let l:res = "\<ESC>a"
    else
      let l:res = "\<C-]>\n"
    endif
  endif
  return l:res
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
  let l:synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(l:synid)
  else
    return l:synid
  endif
endfunction

function! s:get_syn_attr(synid)
  let l:name = synIDattr(a:synid, "name")
  let l:ctermfg = synIDattr(a:synid, "fg", "cterm")
  let l:ctermbg = synIDattr(a:synid, "bg", "cterm")
  let l:guifg = synIDattr(a:synid, "fg", "gui")
  let l:guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name":    l:name,
        \ "ctermfg": l:ctermfg,
        \ "ctermbg": l:ctermbg,
        \ "guifg":   l:guifg,
        \ "guibg":   l:guibg}
endfunction

function maxmellon#syntax_info()
  let l:baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: "       .l:baseSyn.name .
        \ " ctermfg: ".l:baseSyn.ctermfg .
        \ " ctermbg: ".l:baseSyn.ctermbg .
        \ " guifg: "  .l:baseSyn.guifg .
        \ " guibg: "  .l:baseSyn.guibg
  let l:linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: "       .l:linkedSyn.name .
        \ " ctermfg: ".l:linkedSyn.ctermfg .
        \ " ctermbg: ".l:linkedSyn.ctermbg .
        \ " guifg: "  .l:linkedSyn.guifg .
        \ " guibg: "  .l:linkedSyn.guibg
endfunction

