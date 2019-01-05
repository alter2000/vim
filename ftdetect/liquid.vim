" This is Jekyll Liquid, so fuck off and let me break my fucking standards.
au BufNewFile,BufRead *.css,*.scss,*.js
  \ if getline(1) == '---' | set ft=liquid | endif
