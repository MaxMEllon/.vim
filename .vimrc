let g:false = maxmellon#bool#falsy()
let g:true  = maxmellon#bool#truthy()
let g:mapleader = ','

command! -nargs=+ -bar Source call maxmellon#source#call(<args>)

" built in plugin settings {{{
let g:loaded_matchparen        = 1
let g:loaded_gzip              = 1
let g:loaded_matchit           = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
" let g:netrw_banner       = 1
" let g:netrw_browse_split = 1
" let g:netrw_preview      = 1
" let g:netrw_altv         = 1
" let g:netrw_winsize      = -60
" let g:netrw_cursor       = 3
" }}}

let g:env = {}
let g:env.neo     = maxmellon#vimtype#is_neo()
let g:env.cui     = maxmellon#vimtype#is_cvim()
let g:env.gui     = maxmellon#vimtype#is_gvim()
let g:env.cygwin  = maxmellon#os#is_cygwin()
let g:env.win     = maxmellon#os#is_windows()
let g:env.mac     = maxmellon#os#is_mac()
let g:env.linux   = maxmellon#os#is_linux()
let g:env.term    = has('terminal')
let g:env.vim8    = has('patch-8.0.0039') && has('job') && has('lambda')
let g:env.lua     = has('lua')
let g:env.termgui = has('termguicolors') "&& empty($TMUX)
let g:env.tmux    = !empty($TMUX)
let g:env.clpum   = has('clpum')

Source 'command'    " ~/.vim/rc/command.vim
Source 'encode'     " ~/.vim/rc/encode.vim
Source 'opt'        " ~/.vim/rc/opt.vim
Source 'mapping'    " ~/.vim/rc/mapping.vim
Source 'platform'   " ~/.vim/rc/platform.vim
Source 'plug'       " ~/.vim/rc/plug.vim
Source 'event'      " ~/.vim/rc/event.vim
" Source 'statusline' " ~/.vim/rc/statusline.vim
" Source 'tabline'    " ~/.vim/rc/tabline.vim

" if g:env.term
"   Source 'terminal' " ~/.vim/rc/terminal.vim
"   Abbr c terminal Terminal
" endif
Abbr i tihs this
Abbr i adn and
Abbr i REact React
Abbr i ): );
Abbr i initalize initialize
Abbr c cdu Cdu
Abbr c GGrep Ggrep
Abbr c Q q
Abbr c Qa qa
Abbr c W w
Abbr c WA wa
Abbr c WQ wq
Abbr c Wa wa
Abbr c Wq wq

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
Indent 4, 'go', {'tab': g:true}

Suffix 'javascript', ['.js', '.jsx', '.json', '.sass', '.scss', '.css']
Suffix 'vim', '.nvim'
Suffix 'typescript', ['.ts', '.tsx']

BindFT babelrc    json
BindFT cjsx       coffee
BindFT coffee     coffee
BindFT es6        javascript
BindFT eslintrc   yaml
BindFT ex         elixir
BindFT exs        elixir
BindFT fish       fish
BindFT jsx        javascriptreact
BindFT less       less
BindFT mdx        markdown.javascript.mdx
BindFT nvim       vim
BindFT sass       sass
BindFT scss       sass
BindFT slim       slim
BindFT textlintrc json
BindFT toml       toml
BindFT tsx        typescriptreact
BindFT vimspec    vimspec
BindFT vue        html
BindFT zsh        zsh

ColorScheme 'onedark'

filetype plugin indent on
syntax on

set secure
