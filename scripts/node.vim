function! FindFunction(fctName)
	execute "grep \"\\(var _ride\\)\" %"
	execute "cw"
endfunction

:command! -narg=1 Findfunction :call FindFunction(<q-args>)
