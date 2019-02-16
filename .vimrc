"---------------------------------------------------------------------
"          _
"   _   __(_)___ ___  __________
"  | | / / / __ `__ \/ ___/ ___/
" _| |/ / / / / / / / /  / /__
"(_)___/_/_/ /_/ /_/_/   \___/
"
"---------------------------------------------------------------------

"---------------------------------------------------------------------
" Basic
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8 "Vim script内でマルチバイト文字を使う場合の文字コードの設定。vimrcファイルもvim scriptに含まれるので日本語のコメントを書く場合は先頭にこの設定が必要
filetype plugin on " filetypeを判別する

"---------------------------------------------------------------------
" Plugins
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
call dein#add('bronson/vim-trailing-whitespace') " :FixWhitespace will delete hilighted white spaces
call dein#add('Shougo/deoplete.nvim')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('hashivim/vim-terraform')
call dein#add('slim-template/vim-slim')

if dein#check_install()
  call dein#install()
endif

call dein#end()

"---------------------------------------------------------------------
" Options
set fenc=utf-8                 " 文字コードをutf-8に設定
set hidden                     " bufferが編集中でも他のファイルを開けるようにする
set number                     " 行番号を表示する
set title                      " タイトルをウィンドウ枠に表示
set nobackup                   " backupを取らない
set autoread                   " 変更があったときに自動で読み込む
set noswapfile                 " swapファイルを作らない
set showcmd                    " コマンドをステータス行に表示
set showmode                   " 現在のモードを表示
set notitle                    " vimのtitleを表示しない
set vb t_vb=                   " ビープを鳴らさないようにする
set backspace=indent,eol,start " バックスペースで消せるようにする
set clipboard+=unnamed         " OSのclipboardを使用する
set clipboard=unnamed          " ヤンクをシステムのクリップボードに共有する
set ignorecase                 " 検索文字列が小文字のみのときに大文字小文字を区別しない
set smartcase                  " 検索文字列に大文字が含まれている場合に区別する
set wrapscan                   " 検索時に最後まで行ったら最初に戻る
set autoindent                 " オートインデントする
set smartindent                " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4               " smartindentで増減する幅
set showmatch                  " 括弧入力時に対応する括弧を表示
set hlsearch                   " 検索結果をハイライト
set cursorline                 " カーソルラインをハイライト
set wildmenu                   " コマンドモードの補完候補をわかりやすく表示
set laststatus=2               " ステータスラインを常に表示
set ruler                      " ステータスラインの右側にカーソルの現在位置を表示

" ターミナルでマウスを使用できるようにする
set mouse=a
set ttymouse=xterm2

"---------------------------------------------------------------------
" Key mappings
let mapleader = "\<Space>"

inoremap <silent> jk <ESC> " jkでインサートモードを抜ける
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> " ハイライトを解除
nnoremap <silent> sh :belowright :terminal<CR>

" 折り返されている行への移動を通常の行移動と同じにする
nnoremap j gj
nnoremap k gk

" Colors
syntax on          " syntax highlightを有効化
colorscheme hybrid " colorchemeを設定。dein#end()でプラグインを読み込んだあとに定義する必要がある。

" Indent
filetype plugin on
"ファイルタイプに合わせたインデントを利用
filetype indent on
"sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
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

" For Shougo/denite.vim
nnoremap    [denite]   <Nop>
nmap    <Leader>d [denite]
nnoremap <silent> [denite]f :Denite file<CR>
nnoremap <silent> [denite]F :Denite file_rec<CR>
nnoremap <silent> [denite]g :Denite grep<CR>

call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')

if executable('rg')
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
endif

" For faith/vim-go
let g:go_fmt_command = "goimports"

" For Shougo/neosnippet
" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

" For hashivim/vim-terraform
let g:terraform_fmt_on_save = 1 " 保存時にterraform fmtを実行

" For Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
