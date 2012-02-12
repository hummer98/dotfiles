#!/bin/bash

DOT_FILES=( .bazaar .gitconfig .gitignore_global .gvimrc .vim .vimrc .tmux.conf .zshrc )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
