if &filetype ==# 'gitcommit' | finish | endif

BindFT babelrc  json
BindFT cjsx     coffee
BindFT coffee   coffee
BindFT es6      javascript
BindFT eslintrc yaml
BindFT ex       elixir
BindFT exs      elixir
BindFT fish     fish
BindFT jsx      javascript
BindFT jsx      javascript
BindFT less     less
BindFT nvim     vim
BindFT sass     sass
BindFT scss     sass
BindFT slim     slim
BindFT toml     toml
BindFT zsh      zsh
BindFT vue      html

Autocmd BufRead,BufEnter *.json set conceallevel=0
