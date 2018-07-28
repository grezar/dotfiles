"---------------------------------------
"          _
"   _   __(_)___ ___  __________
"  | | / / / __ `__ \/ ___/ ___/
" _| |/ / / / / / / / /  / /__
"(_)___/_/_/ /_/ /_/_/   \___/
"
"---------------------------------------

"---------------------------------------
" Basic
syntax enable " syntax highlightを有効化
filetype plugin on " filetypeを判別する

"---------------------------------------
" Dein

"---------------------------------------
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
