if executable('keyboardSwitcher')

  command! IMEForceABC call async#job#start(['keyboardSwitcher', 'select', 'ABC'], {})

  augroup SwitchIME
    autocmd!
    autocmd InsertLeave * call async#job#start(['keyboardSwitcher', 'select', 'ABC'], {})
  augroup END
endif

if exists('+colorcolumn')
  function! s:DimInactiveWindows()
    for i in range(1, tabpagewinnr(tabpagenr(), '$'))
      let l:range = ""
      if i != winnr()
        let l:width = 256 " max
        let l:range = join(range(1, l:width), ',')
        call setwinvar(i, '&colorcolumn', l:range)
      else
        call setwinvar(i, '&colorcolumn', '80,120')
      endif
    endfor
  endfunction

  augroup DimInactiveWindows
    autocmd!
    autocmd WinEnter * call s:DimInactiveWindows()
  augroup END
endif

augroup matchit
  autocmd!
  autocmd FileType ruby let b:match_words =
        \ '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END
