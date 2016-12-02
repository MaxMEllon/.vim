" for tiny vim
if 0 | endif

command! -nargs=+ -bar MyLoad call maxmellon#myload#exec(<args>)

MyLoad 'env'
MyLoad 'command'
MyLoad 'encode'
MyLoad 'opt'
MyLoad 'platform'
MyLoad 'mapping'
MyLoad 'plug'
MyLoad 'filetype'
MyLoad 'indent'
MyLoad 'menu'
MyLoad 'event'
MyLoad 'abbrev'
MyLoad 'cmdwin'
MyLoad 'statusline'

PlugConfigAutoLoad

filetype plugin indent on
syntax on

set secure
