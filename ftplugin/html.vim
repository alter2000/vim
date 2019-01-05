" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

packadd matchit
setlocal nolist
setlocal tabstop=2
setlocal shiftwidth=2
setlocal foldmethod=syntax
iabbrev <// </<C-X><C-O>
:ALEDisableBuffer
