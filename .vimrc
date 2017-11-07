" generate boolean
let g:false = maxmellon#bool#false()
let g:true = maxmellon#bool#true()

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

Source 'command'   " ~/.vim/rc/command.vim
Source 'encode'    " ~/.vim/rc/encode.vim
Source 'opt'       " ~/.vim/rc/opt.vim
Source 'mapping'   " ~/.vim/rc/mapping.vim
Source 'platform'  " ~/.vim/rc/platform.vim
Source 'plug'      " ~/.vim/rc/plug.vim
Source 'event'     " ~/.vim/rc/event.vim

Abbr i tihs this
Abbr i adn and
Abbr i REact React
Abbr i ): );
Abbr i initalize initialize
Abbr c cdu Cdu
Abbr c gn Gina
Abbr c gina Gina
Abbr c ggrep Ggrep
Abbr c hgrep Hgrep
Abbr c gist Gist
Abbr c GGrep Ggrep
Abbr c W w
Abbr c Q q
Abbr c Qa qa
Abbr c WQ wq
Abbr c WA wa
Abbr c Wq wq
Abbr c Wa wa

Indent 4, 'python'
Indent 4, 'java'
Indent 4, 'php', {'tab': g:true}
Indent 4, 'make', {'tab': g:true}
Indent 2, 'yaml'
Indent 4, 'conf', {'tab': g:true}
Indent 2, 'coffee'
Indent 2, 'slim'
Indent 2, 'fish'
Indent 4, 'haskell'

Suffix 'javascript', ['.jsx', '.json', '.sass', '.scss', '.css']
Suffix 'vim', '.nvim'

BindFT babelrc  json
BindFT coffee   coffee
BindFT cjsx     coffee
BindFT es6      javascript
BindFT eslintrc yaml
BindFT ex       elixir
BindFT exs      elixir
BindFT fish     fish
BindFT jsx      javascript
BindFT less     less
BindFT nvim     vim
BindFT sass     sass
BindFT scss     sass
BindFT slim     slim
BindFT toml     toml
BindFT vimspec  vimspec
BindFT vue      html
BindFT zsh      zsh

ColorScheme 'hybrid_material'

filetype plugin indent on
syntax on

set secure
