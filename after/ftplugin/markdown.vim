" Pandoc + Markdown previews
" TODO : The mappings do nothing on screen for some reason, whereas typing
" the full command works

let b:temp_preview = tempname() . '.pdf'

nmap <buffer> <Space>pc :execute "!pandoc -o"
            \ . shellescape(b:temp_preview)
            \ . shellescape(expand("%:p"))
            \ | redraw!
nmap <buffer> <Space>pp :execute "!zathura"
            \ . shellescape(b:temp_preview)
            \ . "&" | redraw!

if !get(g:, 'mywaikikisetup_loaded', 0)
  call mywaikiki#Load()
  let g:mywaikikisetup_loaded = 1
endif

setfiletype pandoc
