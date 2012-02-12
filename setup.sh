#!/bin/bash

DOT_FILES=( .bazaar .gitconfig .gitignore_global .gvimrc .vim .vimrc .tmux.conf .zshrc )

for file in ${DOT_FILES[@]}
do
  if [ ! -L $1 ]; then
    ln -s $HOME/dotfiles/$file $HOME/$file
  else
    echo "既にシンボリックリンク済みです: $file"
  fi
done
