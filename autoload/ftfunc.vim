" Ansible conversion shiz {{{
function! ftfunc#ansiblify()
    exec '%s/"//g'
    exec '%s/\({.*$\)/"\1"/'
    exec '%s/yes/true/'
    exec '%s/=/: /'
endfunction
" }}}
" Epitech headers {{{
function! ftfunc#skel(path)
    let l:path = expand(get(g:, 'epitech_project_path', '$HOME/epitheq'). ':p:h')
    if expand(a:path . ':p') !~# '^'.l:path
        return
    endif
    let l:com = &commentstring
    if !l:com[1]
        call add(l:com, '')
    endif
    call append(0, l:com[0])
    call append(1, l:com[1] . 'EPITECH PROJECT, ', strftime('%Y'))
    call append(2, l:com[1] . shellescape("git remote -v | head -1 | cut -d'/' -f3 | cut -d' ' -f1"))
    call append(3, l:com[3] . 'File description:')
    call append(4, l:com[4] . get(g:, 'epitech_default_description', 'something small'))
    " exe ':normal :0i' . &comments
endfunction
" }}}
