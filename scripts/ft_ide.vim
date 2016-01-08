"source different useful scripts
source		~/.vim/scripts/project.vim

"project management mappings
noremap		<F2> :Project<CR>

"make related mappings
noremap		<F5> :execute ":make -C " . g:projectPath<CR>
noremap		<F6> :execute ":make -C " . g:projectPath . " re" <CR>
noremap		<F7> :execute ":make -C " . g:projectPath . " clean" <CR>
noremap		<F8> :execute ":make -C " . g:projectPath . " fclean" <CR>

"split-pane navigation mappings
noremap		<ALT-Right> <c-w>l
noremap		<ALT-Left> <c-w>h
noremap		<ALT-Up> <c-w>k
noremap		<ALT-Down> <c-w>j 

"42 specific mappings
noremap <F1> :Stdheader <CR>

"TODO enregistrement des path de projet, proposer les projets a ouvrir etc...
