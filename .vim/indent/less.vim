autocmd BufNewFile *.less 0r $HOME/dotfiles/.vim/template/skeleton.less
autocmd BufRead,BufNewFile *.less setfiletype css
