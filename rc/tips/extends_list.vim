" See: http://d.hatena.ne.jp/osyo-manga/20110801/1312205483

let s:algorithms = { "__list" : [] }

function! s:algorithms.list() dict
  return self.__list
endfunction

function! AsList(list)
  let s:algorithms.__list = deepcopy(a:list)
  return s:algorithms
endfunction

function! s:algorithms.sort() dict
  call sort(self.list())
  return self
endfunction

function! s:algorithms.reverse() dict
  call reverse(self.list())
  return self
endfunction

function! s:algorithms.filter(expr) dict
  call filter(self.list(), a:expr)
  return self
endfunction

function! s:algorithms.size() dict
  return len(self.list())
endfunction

function! s:algorithms.map(expr) dict
  call map(self.list(), a:expr)
  return self
endfunction

function! s:algorithms.last() dict
  return self.list()[len(self.list()) - 1]
endfunction

function! s:algorithms.push(value) dict
  call add(self.__list, value)
  return self.list()
endfunction

function! s:algorithms.get(index) dict
  try
    return self.list()[index]
  catch _
    return self.list()
  endtry
endfunction

" let array = [2, 5, 1, 7, 3, 4, 9, 0, 8, 1]
" echo "元の list"
" echo array
" echo "偶数を降順にソートして、2倍にする"
" echo s:as_list(array).filter("v:val % 2 == 0").sort().reverse().map("v:val + v:val").list()
" echo "操作後の list"
" echo array
" echo "通常の組み込み関数で操作すると"
" echo map(reverse(sort(filter(array, "v:val % 2 == 0"))), "v:val + v:val")
" echo "list が破壊的に変更される"
" echo array
