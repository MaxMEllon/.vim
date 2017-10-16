if executable('keyboardSwitcher')
  command! IMEForceABC call async#job#start(['keyboardSwitcher', 'select', 'ABC'], {})
  augroup SwitchIME
    autocmd!
    autocmd InsertLeave * call async#job#start(['keyboardSwitcher', 'select', 'ABC'], {})
  augroup END
endif

if exists('+colorcolumn')
  function! s:DimInactiveWindows()
    for l:i in range(1, tabpagewinnr(tabpagenr(), '$'))
      let l:range = ''
      if l:i != winnr()
        let l:width = 256 " max
        let l:range = join(range(1, l:width), ',')
        call setwinvar(l:i, '&colorcolumn', l:range)
      else
        call setwinvar(l:i, '&colorcolumn', '80,120')
      endif
    endfor
  endfunction

  augroup DimInactiveWindows
    autocmd!
    autocmd WinEnter * call s:DimInactiveWindows()
  augroup END
endif

