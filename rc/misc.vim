if executable('keyboardSwitcher')
  augroup SwitchIME
    autocmd!
    autocmd InsertLeave * call jobproc#system('keyboardSwitcher select U.S.')
  augroup END
endif
