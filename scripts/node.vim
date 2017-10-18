function! FindFunction(fctName)
"	:cexpr [] <-- puts empty list in cw list
	let varFunc = "var\\s\\+" . a:fctName . "\\s\\+=\\s\\+function\\*\\?\\s*(.*)\\s*{"
	execute "vimgrep \"\\(var\\s\\+". a:fctName . "\\s\\+=\\s\\+function\\*\\?\\)\" %"
	execute "cw"
endfunction

function! Toto(fctName)
	:echom "grep \"\\(var\\s\\+". a:fctName . "\\s\\+=\\s\\+function\\*\\?(.*)\\s*{\\)\\|\\(function\\*\\?(.*)\\s*{" . a:fctName . "\\)\" %"
endfunction

:command! -narg=1 Findfunction :call FindFunction(<q-args>)
:command! -narg=1 Toto :call Toto(<q-args>)
