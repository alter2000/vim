setlocal expandtab
setlocal tabstop=8
setlocal shiftwidth=2
setlocal textwidth=79
setlocal iskeyword-='
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal path=.,app,src,test,lib
setlocal suffixesadd=.hs

" enable highlighting of
let g:haskell_enable_quantification = 1   " `forall`
let g:haskell_enable_recursivedo = 1      " `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " `proc`
let g:haskell_enable_pattern_synonyms = 1 " `pattern`
let g:haskell_enable_typeroles = 1        " type roles
let g:haskell_enable_static_pointers = 1  " `static`
let g:haskell_backpack = 1                " backpack keywords
let g:haskell_classic_highlighting = 1

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_case_alternative = 1
let g:haskell_indent_let = 4
let g:haskell_indent_in = 1
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_guard = 2
let g:cabal_indent_section = 2

" packadd vim-haskell-indent

packadd vim-ripple
let b:ripple_repl = [ 'stack ghci', ':{', ':}', 0 ]
