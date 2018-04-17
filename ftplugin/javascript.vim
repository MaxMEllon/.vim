setlocal foldmethod=marker
" setlocal foldmarker=/*,*/

highlight jsArrowFunction      ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsBrackets                       cterm=bold               gui=bold
highlight jsClassBraces        ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsDestructuringBlock ctermfg=194 cterm=bold guifg=#AAFFAA gui=bold
highlight jsFuncBraces         ctermfg=118            guifg=#A6E22E
highlight jsFuncCall           ctermfg=228            guifg=#A6A5AE
highlight jsModuleBraces       ctermfg=14  cterm=bold guifg=#0099FF gui=bold
highlight jsModuleKeyword      ctermfg=225            guifg=#FFBBBB
highlight jsNoise              ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsObjectBraces       ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsVariableDef        ctermfg=194 cterm=bold guifg=#AAFFAA gui=bold

setlocal dictionary=$HOME/.vim/dicts/javascript.vim
