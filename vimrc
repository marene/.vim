set nocompatible
execute pathogen#infect()

" scripts
source ~/.vim/scripts/ft_ide.vim
source ~/.vim/scripts/node.vim
source ~/.vim/scripts/sessions.vim

set noswapfile
set mouse=a
		set list lcs=tab:\|\ 
filetype plugin on
filetype plugin indent on
syntax enable

"=====================================================
"              colorscheme: solarized
"=====================================================
	"set bg=dark
	"set t_Co=256
	"let g:solarized_termcolors = 256
	"let g:solarized_contrast = "high"
	"colorscheme solarized
	

"=====================================================
"              colorscheme: onedark
"=====================================================
	colorscheme onedark

" display options
set cursorline
set hlsearch
set nu
set list
set listchars=tab:\|\ ,eol:$

" indent
set autoindent
set smartindent
set noexpandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
autocmd FileType cucumber setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
autocmd FileType jade setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
autocmd FileType javascript source ~/.vim/scripts/node.vim
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8

" sessions
autocmd VimLeave * NERDTreeClose " close NERDTree so it won't get saved in session
autocmd VimLeave * mksession! ./.session.vim
autocmd VimEnter * if argc() == 0 | call LoadSession() | endi
autocmd VimEnter * NERDTree .

hi SpecialKey ctermbg=8

vnoremap // y/<C-R>"<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"gui
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set foldmethod=syntax
