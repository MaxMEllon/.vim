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
