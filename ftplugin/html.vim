" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

packadd matchit
setlocal nolist
setlocal noexpandtab
setlocal tabstop=2
setlocal shiftwidth=2
iabbrev <// </<C-X><C-O>
setlocal foldmethod=indent
let b:delimitMate_matchpairs = '(:),[:],{:},<:>'
" :ALEDisableBuffer

let b:ale_fixers  = ['prettier', 'tidy']
let b:ale_linters  = ['prettier', 'tidy']
