if &termguicolors
	let now = strftime('%H')
	if 9 < now  && now < 19
		set background=light
		let ayucolor = 'dark'
		let g:gruvbox_contrast_dark = 'hard'
		colorscheme ayu
	else
		set background=dark
		let ayucolor = 'mirage'
		let g:gruvbox_contrast_light = 'soft'
		colorscheme agila
	endif
else
	colorscheme elflord
endif
