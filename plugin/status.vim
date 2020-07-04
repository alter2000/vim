exec status#default()

augroup StatuslineHighlight
	" change statusline highlights if maintaining different statuslines
	autocmd!
	autocmd WinEnter exec status#default()
	autocmd WinLeave exec status#nofocus()
	autocmd CmdlineEnter * redrawstatus
augroup end
