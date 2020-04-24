
"""
""" BASIC
"""

set encoding=utf-8
"set number
set wildmenu
set ruler
set cursorline
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=5
set splitbelow
set splitright
set nowrap
set imdisable
set tabstop=2
set shiftwidth=2
set softtabstop=2


"""
""" SEARCH
"""

set ignorecase
set incsearch
set smartcase
set hlsearch
nmap <silent> <Esc><Esc> :nohlsearch<CR>
highlight Search term=standout ctermfg=0 ctermbg=1 guifg=Black guibg=Red



"""
""" STATUS LINE
"""

set statusline=%F%m%{'('.(&fenc!=''?&fenc:&enc).'.'.&ff.')'}%=[%l/%L,%c]
set laststatus=2


"""
""" DEIN
"""

if &compatible
	set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	let s:toml_dir = expand('~/.config/nvim')
	call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
	call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif


"""
"""
"""


