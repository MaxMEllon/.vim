syntax match myVimCommand containedin=vimIsCommand
  \ /\<\%(Source\|Autocmd\|AutocmdFT\|IndentFT\|Abbr\|BindFT\|Indent\)\>/

syntax match vimPlugCommand containedin=vimIsCommand
  \ /\<\%(PlugConfigAutoLoad\|Plug\|MyPlug\|PlugBox\|Lazy\)\>/

highlight default link myVimCommand     Statement
highlight default link vimPlugCommand   Statement
