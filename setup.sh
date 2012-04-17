#!/bin/sh

DOT_FILES=( .bazaar .gitconfig .gitignore_global .gvimrc .vim .vimrc .tmux.conf )

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

# for oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
  ln -s $HOME/dotfiles/.oh-my-zsh/.zshrc.zsh $HOME/.zshrc
  ln -s $HOME/dotfiles/.oh-my-zsh/custom_zshrc.zsh $HOME/.oh-my-zsh/custom/custom_zshrc.zsh
  ln -s $HOME/dotfiles/.oh-my-zsh/metroid.zsh-theme $HOME/.oh-my-zsh/themes/metroid.zsh-theme
  echo "シンボリックリンクを貼りますた"
else
  echo "No directory! $HOME/.oh-my-zsh \n git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
fi
