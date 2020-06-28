
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

set noswapfile

"" save cursor
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


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
""" STATUS & CMD LINE
"""

set statusline=%F%m%{'('.(&fenc!=''?&fenc:&enc).'.'.&ff.')'}%=[%l/%L,%c]
set laststatus=2
set cmdheight=2
set signcolumn=yes
highlight clear SignColumn


"""
""" SUFFIX and filetype
"""

"autocmd BufRead,BufNewFile *.svelte set filetype=html
"autocmd BufRead,BufNewFile *.toml   set filetype=yaml


"""
""" DEIN
"""

if &compatible
	set nocompatible
endif
"" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim') 

	"" deoplete
	"call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	"let g:deoplete#enable_at_startup = 1

	"" neosnippet
	"call dein#add('Shougo/neosnippet.vim')
	"call dein#add('Shougo/neosnippet-snippets')

	"" etc
	let s:toml_dir = expand('~/.config/nvim')
	call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
	call dein#load_toml(s:toml_dir . '/dein-lazy.toml', {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

"filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif


"""
""" NERDTREE
"""

"nnoremap <silent><C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"""
""" BINARY FILE(-b or *.bin)
"""
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre  *.bin let &binary =1
	autocmd BufReadPost * if &binary | silent %!xxd -g 1
	autocmd BufReadPost * set ft=xxd | endif
	autocmd BufWritePre * if &binary | %!xxd -r | endif
	autocmd BufWritePost * if &binary | silent %!xxd -g 1
	autocmd BufWritePost * set nomod | endif
augroup END


"""
""" END
"""


