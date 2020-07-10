" if exists('b:did_ftplugin')
"     finish
" endif
" let b:did_ftplugin = 1

setlocal expandtab
setlocal tabstop=4
setlocal makeprg=./%
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal colorcolumn=80
setlocal keywordprg=man
setlocal keywordprg=:vert\ term\ ++close\ man

packadd vim-ripple
let b:ripple_repl = 'bash'
