let g:quickrun_config = {
      \  '_': {
      \     'runner' : 'job',
      \     'runner/vimproc/updatetime' : 60,
      \     'outputter/buffer/split' : '',
      \     'outputter/quickfix/open_cmd' : "",
      \     'hook/time/enable': '1',
      \     "hook/back_window/enable" : 1,
      \     "hook/back_window/enable_exit" : 1,
      \   }
      \ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "<C-c>"
