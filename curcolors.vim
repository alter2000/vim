if &termguicolors
	if (strftime('%H') % 20) > 9
		execute 'set background=light'
		let ayucolor = 'light'
		colorscheme ayu
	else
		execute 'set background=dark'
		" let ayucolor = 'mirage'
		colorscheme agila
	endif
else
	colorscheme elflord
endif
