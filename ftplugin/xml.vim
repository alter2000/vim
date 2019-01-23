packadd matchit
setlocal foldmethod=syntax

let b:xml_syntax_folding=1
let b:delimitMate_matchpairs = '(:),{:},<:>'

iabbrev <buffer> <// </<C-X><C-O>

:%foldopen!
