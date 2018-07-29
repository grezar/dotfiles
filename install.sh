#!/bin/sh

set -u

DOTPATH=$(cd $(dirname $0) && pwd)
DEINPATH="$DOTPATH"/.vim/dein/repos/github.com/Shougo/dein.vim

# Creating symbolic links
for dotfile in .??*; do
  [ "$dotfile" = ".git" ] && continue
  [ "$dotfile" = ".gitignore" ] && continue

  ln -nsfv "$DOTPATH"/"$dotfile" "$HOME"/"$dotfile"
done

# Installing dein.vim
[ ! -d "$DEINPATH" ] && git clone https://github.com/Shougo/dein.vim.git "$DEINPATH"
