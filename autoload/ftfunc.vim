function! ftfunc#ansiblify()
	%s/"//g
	%s/\({.*$\)/"\1"/
	%s/yes/true/
	%s/=/: /
endfunction

