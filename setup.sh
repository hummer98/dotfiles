#!/bin/sh

DOT_FILES=( .bazaar .gitconfig .gitignore_global .gvimrc .vim .vimrc .tmux.conf .zshrc )

for file in ${DOT_FILES[@]}
do
  if [ -L $HOME/$file ]; then
    echo "シンボリックリンクが存在します: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
