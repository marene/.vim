let projectName=""
let projectPath=$PWD
let pathToSave="~/.vim/save/"
let projectExtension=".proj"

:command! -narg=0 Project :execute CreateProject()

function! SetProjectName() "sets project's name for current vim session
	call inputsave()
	 let g:projectName = input("Enter project's name: ")
	call inputrestore()
endfunction

function! SetProjectPath() "sets project's root path for current vim session
	call inputsave()
	let g:projectPath = input("Enter project's path: ", $PWD, "dir")
	call inputrestore()
endfunction

function! OpenProjectTree() "opens up the NERDTree for the project's path
	execute ":NERDTree " . g:projectPath
endfunction

function! SaveProject()
	:execute ":!echo " . g:projectName . " " . g:projectPath . " >>" . g:pathToSave . g:projectName . g:projectExtension
	if filereadable(expand(g:pathToSave . g:projectName . g:projectExtension))
		:echo "Project saved!"
	else
		:echo "Impossible to save project! " . g:pathToSave . g:projectName . g:projectExtension
	endif
endfunction

function! CreateProject()
	if g:projectName != ""
		let ans=""
		while ans !=? "y" && ans !=? "n"
			let ans = input("Do you want to save current project (" . g:projectName . ")? [y / n]: ")
			if ans ==? "y"
				call SaveProject()
			endif
		endwhile
	endif
	:call SetProjectName()
	:call SetProjectPath()
	:call OpenProjectTree()
endfunction

function! LoadProject(projectName, projectPath)
	let g:projectName=projectName
	let g:project=projectPath
	:call OpenProjectPath()
endfunction
