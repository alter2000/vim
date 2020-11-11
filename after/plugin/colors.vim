if &termguicolors
	if (strftime('%H') % 20) > 9
		set background=light
		let ayucolor = 'light'
		" colorscheme ayu
	else
		set background=dark
		let ayucolor = 'mirage'
		" colorscheme agila
	endif
else
	colorscheme elflord
endif
colorscheme gruvbox
