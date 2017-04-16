if executable('keyboardSwitcher')
  augroup SwitchIME
    autocmd!
    autocmd InsertLeave * call jobproc#system('keyboardSwitcher select ABC')
  augroup END
else
  let s:keycode_jis_eisuu = 102
  let g:cmd = "osascript -e 'tell application \"System Events\" to key code " . s:keycode_jis_eisuu . "'"
  augroup SwitchIME
    autocmd!
    autocmd InsertLeave * call jobproc#system(s:cmd)
  augroup END
endif

if !exists('+colorcolumn') | finish | endif

function! s:DimInactiveWindows()
  for i in range(1, tabpagewinnr(tabpagenr(), '$'))
    let l:range = ""
    if i != winnr()
      let l:width=256 " max
      let l:range = join(range(1, l:width), ',')
    endif
    call setwinvar(i, '&colorcolumn', l:range)
  endfor
endfunction

augroup DimInactiveWindows
  autocmd!
  autocmd WinEnter * call s:DimInactiveWindows()
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END
