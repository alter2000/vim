let date = '\d{2,4}(-\d\d){2}'
let time = '\d\d(:\d\d){1,2}'
execute 'syntax region jrnlEntry excludenl start="\v^'.date .' '. time .'(- )?" end="$"'
syn match jrnlEntryTitle '\w\+'

execute 'syntax match jrnlDate "\v'.date.'"'
execute 'syntax match jrnlTime "\v'.time.'"'
syntax match jrnlTag '\v(\@|#|\+).{-}\w+'
syntax match jrnlTodo '- [\S] .*$'

highlight def link jrnlEntryTitle Title
highlight def link jrnlDate Identifier
highlight def link jrnlTime Question
highlight def link jrnlTag Constant
