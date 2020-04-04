command -bar -nargs=* Ss call func#scratchEdit('split', <q-args>)
command -bar -nargs=* Svs call func#scratchEdit('vsplit', <q-args>)
command -bar -nargs=* Ste call func#scratchEdit('tabe', <q-args>)

command -bar -bang -nargs=0 -range=% TrimSpaces <line1>,<line2>call func#trimSpaces(<bang>0)

command -bar -nargs=0 Write call func#modeWriting()

" Usage:
" :Redir hi ............. show full output of ':hi' in a scratch window
" :Redir !ls -al ........ show full output of ':!ls -al' in a scratch window
command -nargs=1 -complete=command Redir silent call func#redir(<f-args>)

command -nargs=* -complete=shellcmd Do call func#asyncDo(<q-args>)

command -bar Vmake silent w | silent make | unsilent redraw! | cwindow

command -bar -nargs=* AdjustWinH call func#adjustWinHeight()

command Joana call func#Joana()
command Dejoana call func#Dejoana()

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr func#callGrep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr func#callGrep(<q-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
	autocmd QuickFixCmdPost *grep*   cwindow
	" open QFix window if makeprg has errors
	autocmd QuickFixCmdPost [^l]*    cwindow

	" autocmd FilterWritePre * if &diff | map <leader>{ :diffget LOCAL<cr> | endif
	" autocmd FilterWritePre * if &diff | map <leader>} :diffget REMOTE<cr>| endif
	" autocmd FilterWritePre * if &diff | map <leader>\| :diffget BASE<cr> | endif

augroup END
