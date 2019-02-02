" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

packadd matchit
setlocal nolist
setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal foldmethod=indent
let b:delimitMate_matchpairs = '(:),[:],{:},<:>'
" :ALEDisableBuffer

iabbrev <buffer> <// </<C-X><C-O>

let b:ale_fixers  = ['prettier', 'tidy']
let b:ale_linters  = ['prettier', 'tidy']
