setlocal spell
setlocal textwidth=72
setlocal colorcolumn=73
match ErrorMsg /\%1l.\%>51v/

let &path .= func#git_root('<afile>')
