let g:indentLine_color_term = 232
let g:indentLine_color_tty_light = 16
let g:indentLine_color_dark = 1
let g:indentLine_bufNameExclude = ['NERD_tree.*']
let g:indentLine_char = '|'

Autocmd BufEnter * IndentLinesReset

call AddToggleCommand('IndentLinesToggle')
