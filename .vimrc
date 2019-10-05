syntax on
colorscheme desert
scriptencoding utf-8

set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
set ambiwidth=double

set wildmenu

" set list
set scrolloff=5
set guioptions+=R
" set number
set cursorline
set nowrap
set textwidth=0
set showmatch matchtime=1
set statusline=%F%m%{'('.(&fenc!=''?&fenc:&enc).'.'.&ff.')'}%=[%l/%L,%c]
set laststatus=2

set imdisable
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set autoindent
set matchpairs& matchpairs+=<:>

set ignorecase
set incsearch
set smartcase
set hlsearch
nmap <silent> <Esc><Esc> :nohlsearch<CR>


autocmd BufWritePre * :%s/\s\+$//ge
" autocmd BufNewFile,BufRead *.rs  set filetype=perl

inoremap <silent> jj <ESC>

highlight Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow

let OSTYPE = system('uname')
if OSTYPE == "Linux\n" || OSTYPE == "Darwin\n"
  set directory=/tmp
  set backupdir=/tmp
endif
if OSTYPE == "win32\n"
 set noswapfile
 set nobackup
endif

" set paste

