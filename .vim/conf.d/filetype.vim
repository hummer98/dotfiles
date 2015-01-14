filetype plugin on
let s:coding_styles = {}
let s:coding_styles['MDC'] = 'set expandtab tabstop=2 shiftwidth=2 softtabstop&'
let s:coding_styles['defacto'] = 'set noexpandtab tabstop=4 shiftwidth=4 softtabstop&'
let s:coding_styles['My style'] = 'set expandtab tabstop=2 shiftwidth=2 softtabstop&'

command!
\   -bar -nargs=1 -complete=customlist,s:coding_style_complete
\   CodingStyle
\   execute get(s:coding_styles, <f-args>, '')

function! s:coding_style_complete(...) "{{{
  return keys(s:coding_styles)
endfunction "}}}

augroup template
  autocmd!
  " for text -----------------------------
  autocmd BufNewFile *.txt 0r $HOME/dotfiles/.vim/template/skeleton.md
  autocmd BufNewFile *.md 0r $HOME/dotfiles/.vim/template/skeleton.md

  " for HTML -----------------------------
  autocmd BufNewFile *.html 0r $HOME/dotfiles/.vim/template/skeleton.html
  autocmd BufNewFile *.jade 0r $HOME/dotfiles/.vim/template/skeleton.jade
  autocmd BufRead,BufNewFile *.mtml setfiletype html

  " for JavaScript -----------------------
  autocmd BufNewFile *.js 0r $HOME/dotfiles/.vim/template/skeleton.js
  autocmd Filetype javascript setl autoindent
  autocmd FileType javascript setl smartindent cinwords=if,else,for,while,try,except,finally,def,class
  autocmd FileType javascript setl expandtab tabstop=2 shiftwidth=2 softtabstop=0

  " for StyleSheet -----------------------
  autocmd BufNewFile *.css 0r $HOME/dotfiles/.vim/template/skeleton.css
  autocmd BufNewFile *.less 0r $HOME/dotfiles/.vim/template/skeleton.less
  autocmd BufRead,BufNewFile *.less setfiletype css

  " for Python ---------------------------
  autocmd BufNewFile *.py 0r $HOME/dotfiles/.vim/template/skeleton.py
  autocmd Filetype python setl autoindent
  autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python setl expandtab tabstop=2 shiftwidth=2 softtabstop=0
  autocmd FileType python :inoremap # X#

  " for Ruby -----------------------------
  autocmd Filetype ruby setl autoindent
  autocmd FileType ruby setl smartindent cinwords=if,elsif,else,for,while,try,except,finally,def,class
  autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=0
  autocmd FileType ruby :inoremap # X#

  " for Perl -----------------------------
  autocmd BufNewFile *.pl 0r $HOME/dotfiles/.vim/template/skeleton.pl
  autocmd Filetype perl setl autoindent
  autocmd FileType perl setl smartindent cinwords=if,else,for,while,try,except,finally,def,class
  autocmd FileType perl setl expandtab tabstop=4 shiftwidth=4 softtabstop=0

  " for PHP ------------------------------
  autocmd BufNewFile *.php 0r $HOME/dotfiles/.vim/template/skeleton.php
  autocmd Filetype php setl autoindent
  autocmd FileType php setl smartindent cinwords=if,elseif,else,for,while,try,except,finally,def,class
  autocmd FileType php setl expandtab tabstop=2 shiftwidth=2 softtabstop=0

  " for JSON -----------------------------
  autocmd Filetype json setl conceallevel=1
  autocmd Filetype json setl autoindent
  autocmd FileType json setl smartindent
  autocmd FileType json setl expandtab tabstop=2 shiftwidth=2 softtabstop=0

  " for YAML -----------------------------
  autocmd Filetype yaml setl autoindent
  autocmd FileType yaml setl smartindent
  autocmd FileType yaml setl expandtab tabstop=2 shiftwidth=2 softtabstop=0

  " for SQL -----------------------------
  autocmd Filetype sql setl autoindent
  autocmd FileType sql setl smartindent
  autocmd FileType sql setl expandtab tabstop=4 shiftwidth=4 softtabstop=0

  " for Jive -----------------------------
  autocmd BufRead,BufNewFile *.htme setfiletype c
augroup END
