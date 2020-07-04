set guioptions='PAciMg'  " remove cruft
" Hasklig\ Light\ 11,
set guifont=League\ Mono\ 9
set guipty
execute 'set background=' . ((strftime('%H') % 20) > 7 ? 'light' : 'dark')
packadd gruvbox
colorscheme agila
" if exists('g:loaded_gruvbox')
" 	let g:gruvbox_italic = 1
" 	let g:gruvbox_contrast_dark='oft'
" 	let g:gruvbox_guisp_fallback='fg'
" 	let g:gruvbox_termcolors=256
" endif
" I'm not even using the gooey
" set guicursor=a:block
" " mode aware cursors
" set guicursor+=o:hor50-Cursor
" set guicursor+=n:Cursor
" set guicursor+=i-ci-sm:InsertCursor
" set guicursor+=r-cr:ReplaceCursor-hor20
" set guicursor+=c:CommandCursor
" set guicursor+=v-ve:VisualCursor
" set guicursor+=a:blinkon0
