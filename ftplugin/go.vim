packadd matchit
setlocal foldmethod=syntax

augroup Go
	autocmd!
	autocmd BufWritePre *.go :CocCommand editor.action.organizeImport
augroup END
