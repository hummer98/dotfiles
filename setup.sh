#!/bin/sh

DOT_FILES=( .bazaar .gitconfig .gitignore_global .gvimrc .vim .vimrc .tmux.conf .zshrc )

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    echo "既にファイルかディレクトリかシンボリックリンクが存在します: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを張りました: $file"
  fi
done
