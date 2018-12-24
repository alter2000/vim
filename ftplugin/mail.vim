if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

setlocal nospell
setlocal number
setlocal norelativenumber
setlocal filetype=mail.pandoc
setlocal syntax=pandoc
let b:loaded_delimitMate = 1
