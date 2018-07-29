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
filetype plugin on " filetypeを判別する

"---------------------------------------------------------------------
" Plugins
" インストール方法
" :call dein#install()
set runtimepath+=~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/dotfiles/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('w0ng/vim-hybrid')
call dein#add('Shougo/unite.vim')
call dein#add('kien/ctrlp.vim')

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
set showmatch                  " 括弧入力時に対応する括弧を表示

" ターミナルでマウスを使用できるようにする
set mouse=a
set ttymouse=xterm2

"---------------------------------------------------------------------
" Key mappings
inoremap <silent> jk <ESC> " jkでインサートモードを抜ける

" 折り返されている行への移動を通常の行移動と同じにする
nnoremap j gj
nnoremap k gk

" Colors
syntax on          " syntax highlightを有効化
colorscheme hybrid " colorchemeを設定。dein#end()でプラグインを読み込んだあとに定義する必要がある。

" For Shougo/unite.vim
let g:unite_enable_start_insert=1 " インサートモードで開始
let g:unite_source_history_yank_enable =1 " ヒストリー/ヤンク機能を追加

nnoremap    [unite]   <Nop>
nmap    <Space>u [unite]
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory_mru<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>

if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif

" For kien/ctrlp.vim
" デフォルトのキーマッピングを無効化
let g:ctrlp_map = '<Nop>'
" カレントディレクトリを基準に検索nnoremap <silent> <Space>cf :CtrlPCurWD<CR>
nnoremap <silent> <Space>cf :CtrlPCurWD<CR>
" カレントバッファのルートディレクトリを基準に検索(root:自動認識)nnoremap <silent> <Space>cF :CtrlPRoot<CR>
nnoremap <silent> <Space>cF :CtrlPRoot<CR>
" 最近使ったファイルから検索
nnoremap <silent> <Space>cr :CtrlPMRUFiles<CR>
