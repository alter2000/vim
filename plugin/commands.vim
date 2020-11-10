command -bar -nargs=* Ss call func#scratchEdit('split', <q-args>)
command -bar -nargs=* Svs call func#scratchEdit('vsplit', <q-args>)
command -bar -nargs=* Ste call func#scratchEdit('tabe', <q-args>)

command -bar -bang -nargs=0 -range=% TrimSpaces <line1>,<line2>call func#trimSpaces(<bang>0)

" Usage:
" :Redir hi ............. show full output of ':hi' in a scratch window
" :Redir !ls -al ........ show full output of ':!ls -al' in a scratch window
command -nargs=1 -complete=command Redir silent call func#redir(<f-args>)

command -nargs=* -complete=shellcmd Do call func#asyncDo(<q-args>)
command -bar Vmake silent w | silent make | unsilent redraw! | cwindow

command Joana call func#Joana()
command Dejoana call func#Dejoana()

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr func#callGrep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr func#callGrep(<q-args>)
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

command! -nargs=0 Argnext call func#argNext()
