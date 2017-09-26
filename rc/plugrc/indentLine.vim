let g:indentLine_color_term = 46
let g:indentLine_color_tty_light = 46
let g:indentLine_color_dark = 46
let g:indentLine_bufNameExclude = ['NERD_tree.*']
let g:indentLine_char = "|"

Autocmd BufEnter * IndentLinesReset

call AddToggleCommand('IndentLinesToggle')
