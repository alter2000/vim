" skeletons
if has('autocmd')
	augroup epi_skel

		function! EpiHeader()
			let idk = expand($MYVIMRC)
			echo idk expand(idk.':h')
			" silent! 0r!~/.vim/newvim ~/.vim/dynamic/%:e
			" silent! g,@FILENAME@,s,,\=expand("%:t:r"),
		endfunction

		autocmd BufNewFile * call EpiHeader()
	augroup END
endif
