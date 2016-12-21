setlocal foldmethod=marker
setlocal foldmarker=/*,*/

nnoremap <buffer> } }j
nnoremap <buffer> { k{j

highlight jsNoise              ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsArrowFunction      ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsObjectBraces       ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsClassBraces        ctermfg=197 cterm=bold guifg=#F92672 gui=bold
highlight jsModuleBraces       ctermfg=14  cterm=bold guifg=#0099FF gui=bold
highlight jsVariableDef        ctermfg=194 cterm=bold guifg=#AAFFAA gui=bold
highlight jsDestructuringBlock ctermfg=194 cterm=bold guifg=#AAFFAA gui=bold
highlight jsFuncBraces         ctermfg=118            guifg=#A6E22E
highlight jsModuleKeyword      ctermfg=225            guifg=#FFBBBB
highlight jsFuncCall           ctermfg=228            guifg=#A6A5AE
highlight jsBrackets                       cterm=bold               gui=bold
