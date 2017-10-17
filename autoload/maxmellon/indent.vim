augroup MyIndent
  autocmd!
augroup END

function! maxmellon#indent#set_tab_width(width, is_expand)
  let &l:tabstop = a:width
  let &l:shiftwidth = a:width
  let &l:softtabstop = a:width

  if exists(':IndentLinesReset')
    IndentLinesReset
  endif

  if a:is_expand == maxmellon#bool#true()
    setlocal expandtab
  else
    setlocal noexpandtab
  end
endfunction

function! maxmellon#indent#set(...)
  if a:0 == 3
    let l:opt = a:3
  else
    let l:opt = {}
  endif

  let l:tab = !get(l:opt, 'tab', maxmellon#bool#false())
  execute 'autocmd MyIndent FileType '.a:2.' call maxmellon#indent#set_tab_width('.a:1.','.l:tab.')'
endfunction

