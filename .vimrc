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
scriptencoding utf-8 "Vim script内でマルチバイト文字を使う場合の文字コードの設定。vimrcファイルもvim scriptに含まれるので日本語のコメントを書く場合は先頭にこの設定が必要
filetype plugin on " filetypeを判別する

"---------------------------------------------------------------------
" Plugins
" インストール方法
" :call dein#install()
set runtimepath+=~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/dotfiles/.vim/dein'))

if dein#check_install()
  call dein#install()
endif

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('w0ng/vim-hybrid')
call dein#add('Shougo/unite.vim')
call dein#add('kien/ctrlp.vim')
call dein#add('tacahiroy/ctrlp-funky')
call dein#add('fatih/vim-go')
call dein#add('Shougo/neomru.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('bronson/vim-trailing-whitespace') " :FixWhitespace will delete hilighted white spaces
call dein#add('Yggdroot/indentLine')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('hashivim/vim-terraform')

call dein#end()

"---------------------------------------------------------------------
" Options
set encoding=utf-8             " ファイルを読み込むときの文字コードの設定
set fileencoding=utf-8         " ファイルを保存するときの文字コードの設定
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
inoremap <silent> jk <ESC> " jkでインサートモードを抜ける
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> " ハイライトを解除

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
" dotfilesを表示
let g:ctrlp_show_hidden = 1
" .gitignoreの内容を反映
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky'] " CtrlPの拡張として「funky」を使用
let g:ctrlp_funky_matchtype = 'path' " CtrlPFunkyの有効化
" デフォルトのキーマッピングを無効化
let g:ctrlp_map = '<Nop>'
let g:ctrlp_use_caching=0 " キャッシュを使わない
" カレントディレクトリを基準に検索nnoremap <silent> <Space>cf :CtrlPCurWD<CR>
nnoremap <silent> <Space>cf :CtrlPCurWD<CR>
" カレントバッファのルートディレクトリを基準に検索(root:自動認識)nnoremap <silent> <Space>cF :CtrlPRoot<CR>
nnoremap <silent> <Space>cF :CtrlPRoot<CR>
" 最近使ったファイルから検索
nnoremap <silent> <Space>cr :CtrlPMRUFiles<CR>

" For faith/vim-go
let g:go_fmt_command = "goimports"

" For Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1                     " Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_smart_case = 1                     " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#min_keyword_length = 3                    " 3文字以上の単語に対して補完を有効にする
let g:neocomplete#enable_auto_delimiter = 1                 " 区切り文字まで補完する
let g:neocomplete#auto_completion_start_length = 1          " 1文字目の入力から補完のポップアップを表示
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>" " バックスペースで補完のポップアップを閉じる

" For Shougo/neosnippet
" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

" For hashivim/vim-terraform
let g:terraform_fmt_on_save = 1 " 保存時にterraform fmtを実行
