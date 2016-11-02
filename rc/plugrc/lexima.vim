let g:lexima_enable_basic_rules = 1
let g:lexima_enable_space_rules = 1
let g:lexima_enable_endwise_rules = 1
let g:lexima_enable_newline_rules = 1

call lexima#add_rule({
      \   "at":       '\%#',
      \   "char":     ",",
      \   "input":    ",<Space>",
      \})
call lexima#add_rule({
      \   "at":       ', \%#',
      \   "char":     '<CR>',
      \   "input":    '<BS><Enter>',
      \})
call lexima#add_rule({
      \   "at":       '`\s*\%#\s*`',
      \   "char":     '$',
      \   "input":    '${}<LEFT>',
      \   "filetype": 'javascript',
      \})
call lexima#add_rule({
      \   "at":       '"\s*\%#\s*"',
      \   "char":     '#',
      \   "input":    '#{}<LEFT>',
      \   "filetype": ['ruby', 'elixir'],
      \})
