syntax on
colorscheme desert
scriptencoding utf-8

set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
set ambiwidth=double

set wildmenu

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start

set splitbelow

" set list
set scrolloff=5
set guioptions+=R
" set number
set cursorline
set nowrap
set textwidth=0
set showmatch matchtime=1

""" statusline
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
highlight Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow


autocmd BufWritePre * :%s/\s\+$//ge
" autocmd BufNewFile,BufRead *.rs  set filetype=perl

inoremap <silent> jj <ESC>

""" language servers.
"if executable('rls')
"	au User lsp_setup call lsp#register_server({
"		\ 'name': 'rls',
"		\ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
"		\ 'whitelist': ['rust'],
"		\ })
"endif
"let g:LanguageClient_autoStart = 1
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>


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

