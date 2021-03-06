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
call dein#add('Shougo/defx.nvim')
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
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

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
autocmd FileType rb          setlocal sw=2 sts=2 ts=2 et
autocmd FileType go          setlocal sw=4 sts=4 ts=4 et
autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
autocmd FileType py          setlocal sw=2 sts=2 ts=2 et
autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
autocmd FileType yml         setlocal sw=2 sts=2 ts=2 et
autocmd FileType sh          setlocal sw=2 sts=2 ts=2 et

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
nnoremap <silent> [denite]b :Denite buffer<CR>

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
nnoremap <silent> <leader>s :source ~/.vimrc<CR>

" Open .vimrc quickly
nnoremap <silent> <leader>o :vsplit ~/.vimrc<CR>

" For Shougo/defx.nvim
nnoremap <silent> <leader>f :Defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

" For bronson/vim-trailing-whitespace
let g:extra_whitespace_ignored_filetypes = ['defx']
