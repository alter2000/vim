" colorscheme seoul256-light
" finish

if &termguicolors
	if (strftime('%H') % 20) > 9
		execute 'set background=light'
		let ayucolor = 'light'
		colorscheme seoul256-light
	else
		execute 'set background=dark'
		let ayucolor = 'mirage'
		colorscheme agila
	endif
else
	colorscheme elflord
endif
