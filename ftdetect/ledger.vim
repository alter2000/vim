autocmd BufNewFile,BufRead * if expand('%') == expand($LEDGER_FILE) | setlocal filetype=ledger | endif
