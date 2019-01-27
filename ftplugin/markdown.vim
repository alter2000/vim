if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

setlocal nospell
setlocal spelllang=en,fr
setlocal textwidth=79
setlocal wrap

packadd goyo.vim
packadd vim-gnupg
packadd vim-pandoc
packadd vim-pandoc-after
packadd vim-pandoc-syntax

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

call mywaikiki#Load()
call mywaikiki#SetupBuffer()

setfiletype pandoc
setlocal syntax=pandoc
