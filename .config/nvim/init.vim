set encoding=utf-8
scriptencoding utf-8

set runtimepath +=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('cohama/lexima.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('hashivim/vim-terraform')
  call dein#add('juliosueiras/vim-terraform-completion')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on
colorscheme hybrid

set hidden
set number
set showcmd
set noshowmode
set title
set nobackup
set noswapfile
set autoread
set showmatch
set cursorline
set wildmenu
set laststatus=2
set ruler
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start

autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd FileType html       setlocal sw=4 sts=4 ts=4 et
autocmd FileType css        setlocal sw=4 sts=4 ts=4 et
autocmd FileType scss       setlocal sw=4 sts=4 ts=4 et
autocmd FileType sass       setlocal sw=4 sts=4 ts=4 et
autocmd FileType js         setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType json       setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml       setlocal sw=4 sts=4 ts=4 et
autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType bash       setlocal sw=4 sts=4 ts=4 et
autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et

nnoremap <space> <nop>
xnoremap <space> <nop>
let mapleader = "\<space>"

inoremap <silent>jk <ESC>

nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l
nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap j gj
nnoremap k gk

nnoremap [denite] <Nop>
nmap <leader>d [denite]

nnoremap <silent> [denite]f :Denite file/rec<CR>
nnoremap <silent> [denite]g :Denite grep<CR>
nnoremap <silent> [denite]b :Denite buffer<CR>

" ctags
let g:pid = getpid()
let g:tags_file_path = "/tmp/" . "tags" . g:pid

function! s:ctags_generate() abort
  exe 'silent! !ctags -R -f '.g:tags_file_path.' $(pwd) &'
  exe 'set tags='.g:tags_file_path
endfunction
command! -nargs=0 CtagsGenerate call s:ctags_generate()

function! s:ctags_remove() abort
  exe 'silent! !rm -f '.g:tags_file_path
endfunction
command! -nargs=0 CtagsRemove call s:ctags_remove()

autocmd VimEnter * silent! :CtagsGenerate
autocmd BufWrite * silent! :CtagsGenerate
autocmd VimLeave * silent! :CtagsRemove

" Shougo/denite.nvim
if executable('rg')
  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '--hidden'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
endif

call denite#custom#source('file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#kind('file', 'default_action', 'vsplit')

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" hashivim/vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1