" generate boolean
let g:false = 0
let g:true = !g:false

command! -nargs=+ -bar Source call maxmellon#source#call(<args>)

" built in plugin settings {{{
let g:loaded_matchparen      = 1
let g:loaded_gzip            = 1
let g:loaded_tar             = 1
let g:loaded_tarPlugin       = 1
let g:loaded_zip             = 1
let g:loaded_zipPlugin       = 1
let g:loaded_rrhelper        = 1
" let g:loaded_2html_plugin    = 1
let g:loaded_vimball         = 1
let g:loaded_vimballPlugin   = 1
let g:loaded_getscript       = 1
let g:loaded_getscriptPlugin = 1
" let g:loaded_netrw             = 1
" let g:loaded_netrwPlugin       = 1
" let g:loaded_netrwSettings     = 1
" let g:loaded_netrwFileHandlers = 1
let g:netrw_banner       = 0
let g:netrw_browse_split = 0
let g:netrw_preview      = 1
let g:netrw_altv         = 1
let g:netrw_winsize      = -60
let g:netrw_cursor       = 3
" }}}

" set global environment {{{
let g:env = {}
let g:env.neo    = maxmellon#vimtype#is_neo()
let g:env.cui    = maxmellon#vimtype#is_cvim()
let g:env.gui    = maxmellon#vimtype#is_gvim()
let g:env.cygwin = maxmellon#os#is_cygwin()
let g:env.win    = maxmellon#os#is_windows()
let g:env.mac    = maxmellon#os#is_mac()
let g:env.linux  = maxmellon#os#is_linux()
let g:env.vim8   = has('patch-8.0.0039') && has('job') && has('lambda')
let g:env.lua    = has('lua')
let g:env.clpum  = has('clpum')
" }}}

Source 'command'
Source 'encode'
Source 'opt'
Source 'mapping'
Source 'platform'
Source 'plug'
Source 'filetype'
Source 'indent'
Source 'menu'
Source 'event'
Source 'abbrev'
Source 'cmdwin'
Source 'misc'

try
  colorscheme hybrid_material
catch
  colorscheme default
endtry

filetype plugin indent on
syntax on

set secure
