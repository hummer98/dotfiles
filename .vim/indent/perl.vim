autocmd BufNewFile *.pl 0r $HOME/dotfiles/.vim/template/skeleton.pl
setl autoindent
setl smartindent cinwords=if,else,for,while,try,except,finally,def,class
setl expandtab tabstop=4 shiftwidth=4 softtabstop=0
