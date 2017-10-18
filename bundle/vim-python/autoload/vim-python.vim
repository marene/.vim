let s:path = expand('<sfile>:hp')
function! HelloWorld()
	let l:script = s:path . "/../src/helloworld.py"
	exec "py3file " . l:script
endfunc
