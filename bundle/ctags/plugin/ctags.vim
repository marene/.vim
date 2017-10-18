let s:tagDir = $PWD . "/.tags"
let s:tagFile = s:tagDir . "/tags"
let s:excludes = "--exclude=\".session.vim\" --exclude=\"*node_modules/*\""

set tags=s:tagFile

function! Silentify(command)
	return "silent !" . a:command . " > /dev/null 2>&1 &"
endfunction

function! ExecuteSilent(command)
	let l:silentified = Silentify(a:command)
	execute l:silentified
endfunction

function! Tag(word)
	execute "tag " . a:word
endfunction

function! Vstag(word)
	vsplit
	execute "tag " . a:word
endfunction

function! Stag(word)
	split
	execute "tag " . a:word
endfunction

function! UpdateCtags()
	call ExecuteSilent("exctags --tag-relative=yes " . s:excludes . " --append -f " . s:tagFile . " " . expand("%"))
"	execute "silent redraw!"
endfunction

function! InitCtags()
	if !isdirectory(s:tagDir)
		call ExecuteSilent("mkdir " . s:tagDir)
	endif
	if !filereadable(s:tagFile)
		execute "!exctags --tag-relative=yes -R " . s:excludes . " -f " . s:tagFile . " " . $PWD
	endif
	execute "silent set tags=" . s:tagFile
endfunction

function! ReinitCtags()
	call ExecuteSilent("rm " . s:tagFile)
	call InitCtags()
endfunction

command! -nargs=0 Vstag call Vstag(expand("<cword>"))
command! -nargs=0 Stag call Stag(expand("<cword>"))
command! -nargs=0 Tag call Tag(expand("<cword>"))

command! -nargs=0 ReinitTags call ReinitCtags()
nmap <leader>v :Vstag<CR>
nmap <leader>s :Stag<CR>
nmap <leader>] :Tag<CR>

autocmd VimEnter * execute "call InitCtags()"
autocmd BufWritePost * execute "call UpdateCtags()"
