#!/bin/sh

set -u

DOTPATH=$(cd $(dirname $0) && pwd)

for dotfile in .??*; do
  [ "$dotfile" = ".git" ] && continue
  [ "$dotfile" = ".gitignore" ] && continue

  ln -nsfv "$DOTPATH"/"$dotfile" "$HOME"/"$dotfile"
done
