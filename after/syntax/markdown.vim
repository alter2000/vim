let g:markdown_fenced_languages = [
	\	'shebang=python', 'bash=sh', 'c', 'cpp',
	\	'haskell', 'rust', 'html', 'yaml',
	\	'css', 'tex',
	\	]

syntax match todoCheckbox "\[\ \]" conceal cchar=
syntax match todoCheckbox "\[x\]" conceal cchar=
syntax match todoCheckbox "\[\.\]" conceal cchar=

" checkboxes:  
" radio buttons:  
let readline_has_bash = 1
" runtime! OPT syntax/pandoc.vim
