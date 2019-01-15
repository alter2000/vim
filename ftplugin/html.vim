" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

packadd matchit
setlocal nolist
setlocal noexpandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal foldmethod=indent
iabbrev <// </<C-X><C-O>
:ALEDisableBuffer

let b:ale_fixers  = ['prettier', 'tidy']
let b:ale_linters  = ['prettier', 'tidy']
