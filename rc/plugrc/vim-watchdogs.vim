let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config['watchdogs_checker/_'] = {
      \   'runner' : 'vimproc',
      \   'runner/vimproc/sleep' : 10,
      \   'runner/vimproc/updatetime' : 500,
      \   'outputter/buffer/split' : '',
      \   'outputter/quickfix/open_cmd' : "",
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
let g:quickrun_config['watchdogs_checker/clang++'] = {
      \   'command': 'clang++',
      \   'exec':    '%c %o -Wall -Wextra -std=c++1y -stdlib=libc++ -fsyntax-only %s:p',
      \ }
let g:quickrun_config['watchdogs_checker/g++'] = {
      \   'command': 'g++',
      \   'exec':    '%c %o -Wall -Wextra -std=c++11 -fsyntax-only %s:p',
      \ }
let g:quickrun_config['cpp/watchdogs_checker'] = {
      \   'type': 'watchdogs_checker/g++',
      \ }
if executable('sass')
  let g:quickrun_config['watchdogs_checker/sass'] = {
        \   'command':     'sass',
        \   'exec':        '%c %o --check --compass --trace --no-cache %s:p',
        \   'errorformat': '%f:%l:%m\ (Sass::SyntaxError),%-G%.%#',
        \ }
  let g:quickrun_config['sass/watchdogs_checker'] = {
        \   'type': 'watchdogs_checker/sass',
        \ }

  let g:quickrun_config['watchdogs_checker/scss'] = {
        \   'command': 'sass',
        \   'exec': '%c %o --check --compass --trace --no-cache %s:p',
        \   'errorformat': '%f:%l:%m\ (Sass::SyntaxError),%-G%.%#',
        \ }
  let g:quickrun_config['scss/watchdogs_checker'] = {
        \   'type': 'watchdogs_checker/scss',
        \ }
endif
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
if executable('slimrb')
  let g:quickrun_config['watchdogs_checker/slim'] = {
        \   'command': 'slimrb',
        \   'exec':    '%c %o > /dev/null %s:p',
        \   'errorformat': '(Slim::Parser::SyntaxError)',
        \ }
  let g:quickrun_config['slim/watchdogs_checker'] = {
        \   'type': 'watchdogs_checker/slim',
        \ }
end
if executable('elixir')
  let g:quickrun_config['watchdogs_checker/elixir'] = {
        \   'command'     : 'elixir',
        \   'exec'        : '%c %s',
        \   'errorformat' : '**\ (%.%#Error)\ %f:%l:\ %m, %-G%.%#',
        \ }
  let g:quickrun_config['elixir/watchdogs_checker'] = {
        \     'type'      : "watchdogs_checker/elixir",
        \}
end
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_BufWritePost_enables = {
      \ 'c'              : 0,
      \ 'cpp'            : 0,
      \ 'python'         : 0,
      \ 'vim'            : 0,
      \ 'php'            : 0,
      \ 'ruby'           : 0,
      \ 'slim'           : 0,
      \ 'java'           : 0,
      \ 'sass'           : 0,
      \ 'javascript'     : 1,
      \ }
let g:watchdogs_check_CursorHold_enable = 0
call watchdogs#setup(g:quickrun_config)
