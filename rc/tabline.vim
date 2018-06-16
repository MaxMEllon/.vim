" 各タブページのカレントバッファ名+αを表示
function! s:tabpage_label(n)

  " タブページ内のバッファのリスト
  let bufnrs = tabpagebuflist(a:n)

  " カレントタブページかどうかでハイライトを切り替える
  let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

  " バッファが複数あったらバッファ数を表示
  let no = len(bufnrs)
  if no is 1
    let no = ''
  endif
  " タブページ内に変更ありのバッファがあったら '+' を付ける
  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
  let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける

  " カレントバッファ
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
  let fname = pathshorten(bufname(curbufnr))
  if empty(fname)
    let fname = 'E'
  endif
  let fname = ' ' . fname . ' '

  let label = no . mod . sp . fname

  return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
endfunction

function! MakeTabLine()
  let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
  let sep = ''
  let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
  let pwd = maxmellon#pwd#get()
  let splitted = split(pwd, '/')
  let len = len(splitted)
  if len > 3
    let pwd =  splitted[len - 3] . '/' . splitted[len - 2] . '/' . splitted[len - 1]
  endif
  let info = '%#TabLinePwd#%  ' . pwd .' %#TabLine#%'
  return tabpages . '%=' . info
endfunction

set tabline=%!MakeTabLine()
