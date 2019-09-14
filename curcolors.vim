if &termguicolors == 1
	if (strftime('%H') % 20) > 9
		" execute 'set background=light'
		" set nocursorcolumn
		let ayucolor = 'light'
		colorscheme ayu
	else
		" execute 'set background=dark'
		" set cursorcolumn
		" let ayucolor = 'mirage'
		colorscheme agila
	endif
	" colorscheme ayu
else
	colorscheme elflord
endif
" colorscheme agila
