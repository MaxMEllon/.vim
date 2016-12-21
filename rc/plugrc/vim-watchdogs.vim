let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config['watchdogs_checker/_'] = {
      \   'runner' : g:env.vim8 ? 'job' : 'vimproc',
      \   'outputter' : 'loclist',
      \   'runner/vimproc/sleep' : 10,
      \   'runner/vimproc/updatetime' : 500,
      \   'outputter/buffer/split' : '',
      \   'outputter/quickfix/open_cmd' : "",
      \   'outputter/loclist/open_cmd' : "",
      \   'hook/echo/enable' : 0,
      \   'hook/echo/output_success': '> No Errors Found.',
      \   'hook/back_window/enable' : 1,
      \   'hook/back_window/enable_exit' : 1,
      \   'hock/close_buffer/enable_hock_loaded' : 1,
      \   'hock/close_buffer/enable_success' : 1,
      \   'hook/qfstatusline_update/enable_exit' : 1,
      \   'hook/qfstatusline_update/priority_exit' : 4,
      \ }

let g:watchdogs_check_BufWritePost_enable_on_wq = 0

if executable('eslint_d')
  let g:quickrun_config['javascript/watchdogs_checker'] = {
        \   'type' : 'watchdogs_checker/eslint',
        \ }
  let g:quickrun_config['javascript.jsx/watchdogs_checker'] = {
        \   'type' : 'watchdogs_checker/eslint',
        \ }
  let g:quickrun_config['watchdogs_checker/eslint'] = {
        \    'command' : 'eslint_d',
        \    'exec'    : '%c -f compact %o %s:p',
        \    'errorformat' : '%E%f: line %l\, col %c\, Error - %m,' .
        \            '%W%f: line %l\, col %c\, Warning - %m,' .
        \            '%-G%.%#',
        \ }
endif

if executable('rubocop')
  let g:quickrun_config['ruby/watchdogs_checker'] = {
        \   "type" : "watchdogs_checker/rubocop"
        \ }
endif

let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_BufWritePost_enables = {
      \ 'c'              : 0,
      \ 'cpp'            : 0,
      \ 'python'         : 0,
      \ 'vim'            : 0,
      \ 'php'            : 0,
      \ 'ruby'           : 1,
      \ 'slim'           : 0,
      \ 'java'           : 0,
      \ 'sass'           : 0,
      \ 'javascript'     : 1,
      \ }
let g:watchdogs_check_CursorHold_enable = 0
call watchdogs#setup(g:quickrun_config)
