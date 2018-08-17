#          _____                    _____                    _____                    _____                    _____          
#         /\    \                  /\    \                  /\    \                  /\    \                  /\    \         
#        /::\    \                /::\    \                /::\____\                /::\    \                /::\    \        
#        \:::\    \              /::::\    \              /:::/    /               /::::\    \              /::::\    \       
#         \:::\    \            /::::::\    \            /:::/    /               /::::::\    \            /::::::\    \      
#          \:::\    \          /:::/\:::\    \          /:::/    /               /:::/\:::\    \          /:::/\:::\    \     
#           \:::\    \        /:::/__\:::\    \        /:::/____/               /:::/__\:::\    \        /:::/  \:::\    \    
#            \:::\    \       \:::\   \:::\    \      /::::\    \              /::::\   \:::\    \      /:::/    \:::\    \   
#             \:::\    \    ___\:::\   \:::\    \    /::::::\    \   _____    /::::::\   \:::\    \    /:::/    / \:::\    \  
#              \:::\    \  /\   \:::\   \:::\    \  /:::/\:::\    \ /\    \  /:::/\:::\   \:::\____\  /:::/    /   \:::\    \ 
#_______________\:::\____\/::\   \:::\   \:::\____\/:::/  \:::\    /::\____\/:::/  \:::\   \:::|    |/:::/____/     \:::\____\
#\::::::::::::::::::/    /\:::\   \:::\   \::/    /\::/    \:::\  /:::/    /\::/   |::::\  /:::|____|\:::\    \      \::/    /
# \::::::::::::::::/____/  \:::\   \:::\   \/____/  \/____/ \:::\/:::/    /  \/____|:::::\/:::/    /  \:::\    \      \/____/ 
#  \:::\~~~~\~~~~~~         \:::\   \:::\    \               \::::::/    /         |:::::::::/    /    \:::\    \             
#   \:::\    \               \:::\   \:::\____\               \::::/    /          |::|\::::/    /      \:::\    \            
#    \:::\    \               \:::\  /:::/    /               /:::/    /           |::| \::/____/        \:::\    \           
#     \:::\    \               \:::\/:::/    /               /:::/    /            |::|  ~|               \:::\    \          
#      \:::\    \               \::::::/    /               /:::/    /             |::|   |                \:::\    \         
#       \:::\____\               \::::/    /               /:::/    /              \::|   |                 \:::\____\        
#        \::/    /                \::/    /                \::/    /                \:|   |                  \::/    /        
#         \/____/                  \/____/                  \/____/                  \|___|                   \/____/         
#                                                                                                                             

[ -f ~/.zshrc.office ] && source ~/.zshrc.office
#
# Basics
#
export LANG=en_US.UTF-8  # 英語を使用する
export GOPATH=~/ghq
export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/bin:$PATH

#
# Options
#
setopt ignore_eof         # Ctrl+Dでのログアウトを無効化
setopt share_history      # 他のターミナルとヒストリーを共有
setopt histignorealldups  # ヒストリーに重複を表示しない
setopt hist_reduce_blanks # ヒストリーに保存するときに余分なスペースを削除
setopt auto_cd            # cdコマンドなしでもディレクトリ名のみで移動可能に
setopt auto_pushd         # 自動でpushdを実行
setopt pushd_ignore_dups  # pushdから重複を削除
setopt print_eight_bit    # 日本語ファイルの表示を可能にする
setopt prompt_subst       # プロンプトが表示されるたびにプロンプト文字列を評価する

# 補完
autoload -Uz compinit promptinit
compinit
promptinit

# 色を使用
autoload -Uz colors
colors

#
# Aliases
#
alias grezar='cd ~/ghq/src/github.com/grezar'
alias g='git'
alias gogo='cd $GOPATH'
alias tf='terraform'

#
# Prompt
#
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:*' formats "%F{blue}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PROMPT='%~${vcs_info_msg_0_} > '

#
# rbenv
#
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
alias lg='lazygit'

#
# evnws
#
function envws() {
  if [ "$(envws-helper e $1)" = "true" ]; then
    eval $(envws-helper $@)
  else
    envws-helper $@
  fi
}
