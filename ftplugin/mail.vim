if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

setlocal nospell
setlocal textwidth=0
setlocal number
setlocal norelativenumber
let b:loaded_delimitMate = 1

packadd goyo.vim
packadd vim-gnupg
packadd vim-pandoc
packadd vim-pandoc-after
packadd vim-pandoc-syntax
