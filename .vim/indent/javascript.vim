autocmd BufNewFile *.js 0r $HOME/dotfiles/.vim/template/skeleton.js
setl autoindent
setl smartindent cinwords=if,else,for,while,try,except,finally,def,class
setl expandtab tabstop=2 shiftwidth=2 softtabstop=0
