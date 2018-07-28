#!/bin/sh

set -u

for dotfile in .??*; do
  [ "$dotfile" = ".git" ] && continue
  [ "$dotfile" = ".gitignore" ] && continue

  ln -nsfv "$dotfile" "$HOME"/"$dotfile"
done
