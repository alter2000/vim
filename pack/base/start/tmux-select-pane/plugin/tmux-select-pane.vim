" yyp over here
if exists('g:loaded_tmux_select_pane')
    finish
endif
let g:loaded_tmux_select_pane = 1

" Intelligently navigate tmux panes and Vim splits using the same keys.
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
let progname = substitute($VIM, '.*[/\\]', '', '')
set title titlestring=%{progname}\ %f\ +%l\ #%{tabpagenr()}.%{winnr()}
if &term =~? '^screen' && !has('nvim')
	exe "set t_ts=\e]2; t_fs=\7"
endif
