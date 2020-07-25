augroup main " {{{
	autocmd!

	" highlight trailing whitespace
	autocmd BufWinEnter * match Error '\s\+$'
	" autocmd BufWinEnter * match Error '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

	" Don't screw up folds when inserting text that might affect them, until leaving insert mode.
	" Foldmethod is local to the window. Protect against screwing up folding when switching between windows.
	autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
	autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

	" :h startify
	autocmd User Startified setlocal cursorline
augroup end " }}}
augroup Colors " {{{
	autocmd!

	autocmd ColorScheme highlight InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
	autocmd ColorScheme highlight VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
	autocmd ColorScheme highlight ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
	autocmd ColorScheme highlight CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16

	" pandoc really needs this
	autocmd ColorScheme highlight! link Conceal          Special

	autocmd ColorScheme highlight! link StatusLineTerm   StatusLine
	autocmd ColorScheme highlight! link StatusLineTermNC StatusLineNC
	autocmd ColorScheme highlight! link VertSplit        NonText
	autocmd ColorScheme highlight  clear SignColumn
augroup END " }}}
augroup C " {{{
	autocmd!

	autocmd BufNewFile *.c   call ftfunc#skel('<afile>')
	autocmd BufNewFile *.h   call ftfunc#skel('<afile>')
	autocmd BufNewFile *.cpp call ftfunc#skel('<afile>')
	autocmd BufNewFile *.hpp call ftfunc#skel('<afile>')
augroup END " }}}
augroup quickfix " {{{
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
	autocmd QuickFixCmdPost *grep*   cwindow
	" open QFix window if makeprg has errors
	autocmd QuickFixCmdPost [^l]*    cwindow

	" autocmd FilterWritePre * if &diff | map <leader>{ :diffget LOCAL<cr> | endif
	" autocmd FilterWritePre * if &diff | map <leader>} :diffget REMOTE<cr>| endif
	" autocmd FilterWritePre * if &diff | map <leader>\| :diffget BASE<cr> | endif
augroup END " }}}
