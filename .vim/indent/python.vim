autocmd BufNewFile *.py 0r $HOME/dotfiles/.vim/template/skeleton.py
setl autoindent
setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setl expandtab tabstop=4 shiftwidth=4 softtabstop=0
:inoremap # X#
