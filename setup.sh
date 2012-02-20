#!/bin/sh

DOT_FILES=( .bazaar .gitconfig .gitignore_global .gvimrc .vim .vimrc .tmux.conf .zshrc )

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ -d $HOME/$file ]; then
      echo "既にディレクトリが存在します: $file"
    elif [ -s $HOME/$file ]; then
      echo "既にシンボリックリンクが存在します: $file"
    else
      echo "既にファイルが存在します: $file"
    fi
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを張りました: $file"
  fi
done
