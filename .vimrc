set encoding=utf-8
set fileencodings=euc-jp,sjis,iso-2022-jp,cp932,utf-8

set wildmenu

" set list
set scrolloff=5
set guioptions+=R
set number
set cursorline
set nowrap
set textwidth=0
set showmatch matchtime=1

set imdisable
set tabstop=4
set autoindent
set matchpairs& matchpairs+=<:>

set directory=/tmp
set backupdir=/tmp

set ignorecase
set incsearch
set smartcase
set hlsearch
nmap <silent> <Esc><Esc> :nohlsearch<CR>


autocmd BufWritePre * :%s/\s\+$//ge

inoremap <silent> jj <ESC>

highlight Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow


