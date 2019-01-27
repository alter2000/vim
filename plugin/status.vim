exec status#default()

augroup StatuslineHighlight
	" change statusline highlights if maintaining different statuslines
	autocmd!
	autocmd WinEnter exec StatusDefault()
	autocmd WinLeave highlight! link StatusLineNC Normal
	autocmd CmdlineEnter * redrawstatus
augroup end

" highlight! Statusline ctermbg=NONE guibg=NONE
" highlight! StatuslineNC ctermbg=NONE guibg=NONE
