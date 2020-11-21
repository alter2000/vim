if &termguicolors
	let now = strftime('%H')
	if 9 < now  && now < 17
		set background=light
		let ayucolor = 'light'
		let g:gruvbox_contrast_dark = 'hard'
		" colorscheme ayu
	else
		set background=dark
		let ayucolor = 'mirage'
		let g:gruvbox_contrast_light = 'soft'
		" colorscheme agila
	endif
else
	colorscheme elflord
endif
colorscheme gruvbox
