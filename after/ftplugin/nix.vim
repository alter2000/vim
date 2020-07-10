if &foldmethod ==? 'marker'
	setlocal foldmethod=indent
endif

packadd vim-ripple
let b:ripple_repl = 'nix repl'
