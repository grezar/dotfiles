"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      ___                       ___           ___           ___
"     /\__\          ___        /\__\         /\  \         /\  \ 
"    /:/  /         /\  \      /::|  |       /::\  \       /::\  \ 
"   /:/  /          \:\  \    /:|:|  |      /:/\:\  \     /:/\:\  \ 
"  /:/__/  ___      /::\__\  /:/|:|__|__   /::\~\:\  \   /:/  \:\  \ 
"  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ /:/\:\ \:\__\ /:/__/ \:\__\
"  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / \/_|::\/:/  / \:\  \  \/__/
"  |:|__/:/  /  \::/__/           /:/  /     |:|::/  /   \:\  \ 
"   \::::/__/    \:\__\          /:/  /      |:|\/__/     \:\  \ 
"    ~~~~         \/__/         /:/  /       |:|  |        \:\__\ 
"                               \/__/         \|__|         \/__/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
"
" Maintained by grezar
"
" TABLE OF CONTENTS
"
" - Plugins
" - Plugin Settings
" - General Settings
" - Search Options
" - Text Settings
" - Key Mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('w0ng/vim-hybrid')
call dein#add('Shougo/denite.nvim')
call dein#add('tacahiroy/ctrlp-funky')
call dein#add('fatih/vim-go')
call dein#add('Shougo/neomru.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Shougo/deoplete.nvim')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('hashivim/vim-terraform')
call dein#add('slim-template/vim-slim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('cohama/lexima.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('juliosueiras/vim-terraform-completion')
call dein#add('grezar/power-vim')

if dein#check_install()
  call dein#install()
endif

call dein#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For Shougo/denite.vim
if executable('rg')
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', '--hidden'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
endif

call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')

" For faith/vim-go
let g:go_fmt_command = "goimports"

" For hashivim/vim-terraform
let g:terraform_fmt_on_save = 1

" For Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" For deoplete-plugins/deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" For tpope/vim-fugitive
set statusline+=%{FugitiveStatusline()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the charcter encodings
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" Let Vim try and figure out filetypes if it can
filetype plugin on

" Enable syntax highlighting
syntax on

" Set colorscheme
colorscheme hybrid

" Open file even if buffer is opened
set hidden

" Show line numbers
set number

" Show command to status bar
set showcmd

" Show current mode
set showmode

" Set title of the window to the filename
set title

" Save without unnecessary stuffs
set nobackup
set noswapfile

" Load diff automatically when file are updated
set autoread

" Disable beep sound
set vb t_vb=

" Configure backspace so it acts as it should act
set backspace=indent,eol,start

" Show matching brackets when text indicator is over them
set showmatch

" Highlight cursor line
set cursorline

" Operate command-line completion in an enhanced mode
set wildmenu

" Always show status line
set laststatus=2

" Show the line and column number of the cursor position
set ruler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Optinos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase                 " Set case insensitive search as the default behaviour
set smartcase                  " Smart case search ignores case if search pattern is all lowercase
set wrapscan                   " If search hit bottom, continuing at top
set hlsearch                   " Highlight search matches
set incsearch                  " Should show search matches as you type

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text tab, spaces Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable loading the indent file for specific file types
filetype indent on

set expandtab                  " Use spaces instead of tabs
set autoindent                 " Enable auto indent
set smartindent                " Insert indent according to shiftwidth
set shiftwidth=4               " 1 tab == 4 spaces

autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
autocmd FileType go          setlocal sw=4 sts=4 ts=4 et

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <space> <nop>
xnoremap <space> <nop>
let mapleader = "\<space>"

inoremap <silent> jk <ESC>
nnoremap <silent><Esc><Esc> :set nohlsearch!<CR>
nnoremap <silent> sh :belowright :terminal<CR>

" Move window comfortably
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k

" For Shougo/denite.vim
nnoremap [denite] <Nop>
nmap <leader>d [denite]
nnoremap <silent> [denite]f :Denite file_rec -highlight-matched-char="Function"<CR>
nnoremap <silent> [denite]g :Denite grep<CR>

" For tpope/vim-fugitive
nnoremap [fugitive] <Nop>
nmap <leader>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]c :Gcommit<CR>
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]r :Grebase<CR>
nnoremap <silent> [fugitive]p :Gpush<CR>
nnoremap <silent> [fugitive]l :Glog<CR>
nnoremap <silent> [fugitive]f :Gfetch<CR>

" Treat collapsed line same as normal line
nnoremap j gj
nnoremap k gk

" Source .vimrc
nnoremap <silent> <leader>s :source .vimrc<CR>
