autocmd BufNewFile *.php 0r $HOME/dotfiles/.vim/template/skeleton.php
setl autoindent
setl smartindent cinwords=if,elseif,else,for,while,try,except,finally,def,class
setl expandtab tabstop=2 shiftwidth=2 softtabstop=0
