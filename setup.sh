#!/bin/sh

DOT_FILES=(
  .conf
  .ctags
  .gitconfig
  .gitignore_global
  .gvimrc
  .jshintrc
  .peco
  .tigrc
  .tmux.conf
  .vim
  .vimrc
  .zshenv
  .zshrc
)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ -L $HOME/$file ]; then
      echo "既にシンボリックリンクが存在します: $file"
    elif [ -d $HOME/$file ]; then
      echo "既にディレクトリが存在します: $file"
    else
      echo "既にファイルが存在します: $file"
    fi
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りますた: $file"
  fi
done

git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/neobundle

