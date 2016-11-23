syntax match myVimCommand containedin=vimIsCommand
  \ /\<\%(MyLoad\|Autocmd\|AutocmdFT\|IndentFT\|Abbr\)\>/

syntax match vimPlugCommand containedin=vimIsCommand
  \ /\<\%(PlugConfigAutoLoad\|Plug\|MyPlug\)\>/

highlight default link myVimCommand     Statement
highlight default link vimPlugCommand   Statement
