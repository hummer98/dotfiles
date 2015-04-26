augroup template
  autocmd!
  autocmd BufNewFile *.css 0r $HOME/dotfiles/.vim/template/skeleton.css
  autocmd BufNewFile *.html 0r $HOME/dotfiles/.vim/template/skeleton.html
  autocmd BufNewFile *.js 0r $HOME/dotfiles/.vim/template/skeleton.js
  autocmd BufNewFile *.less 0r $HOME/dotfiles/.vim/template/skeleton.less
  autocmd BufNewFile *.md 0r $HOME/dotfiles/.vim/template/skeleton.md
  autocmd BufNewFile *.php 0r $HOME/dotfiles/.vim/template/skeleton.php
  autocmd BufNewFile *.pl 0r $HOME/dotfiles/.vim/template/skeleton.pl
  autocmd BufNewFile *.py 0r $HOME/dotfiles/.vim/template/skeleton.py
  autocmd BufNewFile *.txt 0r $HOME/dotfiles/.vim/template/skeleton.md
augroup END
