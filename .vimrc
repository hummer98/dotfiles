" Common -------------------------------
autocmd!
set nocompatible                        " use vim
let mapleader = " "                     " set mapleader
set t_Co=256                            " 256color
set timeout ttimeout timeoutlen=1000 ttimeoutlen=100
" set notimeout ttimeout timeoutlen=100   " マッピングについてはタイムアウトしない, 端末キーコードについては100ms後にタイムアウトする

" Set RunTimePath ----------------------
set rtp+=$HOME/.vim/
runtime! conf.d/*.vim

" External File ------------------------
if filereadable(expand('$HOME/.vim/colors/metroid.vim'))
  colorscheme metroid
  color metroid
endif

" File ---------------------------------
set autoread                            " 更新時自動再読み込み
set hidden                              " 編集中でも他のファイルを開けるようにする
set noswapfile                          " スワップファイルを作らない
set nobackup                            " バックアップを取らない
set noreadonly                          " リードオンリーにしない
set undofile                            " undo履歴ファイルを作る
set undodir=$HOME/.vimundo
set viminfo+=n$HOME/.viminfo
autocmd BufWritePre * :%s/\s\+$//ge     " 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\t/  /ge      " 保存時にtabをスペース2つに変換する
syntax on                               " シンタックスカラーリングオン


" Indent -------------------------------
set expandtab                           " tabをスペースに変換
set tabstop=2 shiftwidth=2 softtabstop=0  " tab展開文字数, autoindent時のインデント数,Tabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
" set textwidth=78                        " 自動改行する文字位置
set autoindent smartindent              " 自動インデント，スマートインデント
set backspace=indent,eol,start          " バックスペースで特殊記号も削除可能に

" Assist imputting ---------------------
set formatoptions=lmoq                  " 整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,s,<,>,[,]           " カーソルを行頭、行末で止まらないようにする


" Complement Command -------------------
set wildmenu                            " コマンド補完を強化
set wildmode=list:full                  " リスト表示，最長マッチ


" Search -------------------------------
set wrapscan                            " 最後まで検索したら先頭へ戻る
set ignorecase                          " 大文字小文字無視
set smartcase                           " 大文字ではじめたら大文字小文字無視しない
set incsearch                           " インクリメンタルサーチ
set hlsearch                            " 検索文字をハイライト
nmap <ESC><ESC> :nohlsearch<CR>         " ESC2回押しでクリア


" View ---------------------------------
set showmatch                           " 括弧の対応をハイライト
set showcmd                             " 入力中のコマンドを表示
set showmode                            " 現在のモードを表示
set number                              " 行番号表示
set nowrap                              " 画面幅で折り返す
set notitle                             " タイトル書き換えない
set scrolloff=5                         " 行送り
set display=uhex                        " 印字不可能文字を16進数で表示
set cursorline                          " カーソル行に下線


" tags
if has('path_extra')
  set tags=.tags;$HOME
endif

" Conceal ------------------------------
if has('conceal')
  set conceallevel=1 concealcursor=
endif


" 不可視文字
set list                                " 不可視文字を表示
set listchars=tab:>\                    " 不可視文字の表示方法
hi ZenkakuSpace guibg=DarkBlue gui=underline ctermfg=LightBlue cterm=underline
match ZenkakuSpace /　/                 " 全角文字


" hitest
command! HiTest :source $VIMRUNTIME/syntax/hitest.vim

" View active status (only gvim) -------
autocmd FocusGained * :echo "Active"
autocmd FocusLost   * :echo "Unactive"


" Clipboard ----------------------------
if has('clipboard')
  set clipboard+=autoselect
endif


" StatusLine ---------------------------
set laststatus=2                        " ステータスラインを2行に
set statusline=%<%F\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

" Show full path  ----------------------
augroup EchoFilePath
  autocmd WinEnter * execute "normal! 1\<C-g>"
augroup END

" Charset, Line ending -----------------
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set ffs=unix,dos,mac                    " LF, CRLF, CR
if exists('&ambiwidth')
  set ambiwidth=double                  " UTF-8の□や○でカーソル位置がずれないようにす
endif


" --------------------------------------
"              my config
" --------------------------------------
" Add blank line
" nnoremap <C-a> :<C-u>call append(expand('.'), '')<Cr>j

" no ABCD in insert mode
set <xUp>=OA
set <xDown>=OB
set <xRight>=OC
set <xLeft>=OD

" <ESC>
nnoremap <C-e> <ESC>
inoremap <C-e> <ESC>

" auto centering
nnoremap n nzz
nnoremap N Nzz

" edit .vimrc
nnoremap <Leader>.   :<C-u>edit $MYVIMRC<Enter>
nnoremap <Leader>s.  :<C-u>source $MYVIMRC<Enter>
nnoremap <C-h>       :<C-u>help<Space>

" yank to end of a line.
nnoremap Y y$

" increment, decrement
nnoremap + <C-a>
nnoremap - <C-x>

" auto left
"imap () ()<Left>
"imap [] []<Left>
"imap '' ''<Left>
"imap "" ""<Left>
"imap <> <><Left>

" Replace the keymap of insert mode(for overlaps with tmux)
imap <C-i> <C-t>
imap <C-u> <C-d>
imap <tab> <tab>

" When insert mode, enable hjkl and enable go to home/end
imap <C-o> <End>
imap <C-a> <Home>
imap <C-h> <BackSpace>
" imap <C-h> <Left>
" imap <C-j> <Down>
" imap <C-k> <Up>
" imap <C-l> <Right>

" current buffer's movement
nnoremap cp :cprevious<CR>
nnoremap cn :cnext<CR>
nnoremap cf :cfirst<CR>
nnoremap cl :clast<CR>

" Auto fill
nnoremap <silent>cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent>cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent>ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" Set toggle setting
nnoremap <Leader>1 :<C-u>set number!<CR>
nnoremap <Leader>2 :<C-u>set relativenumber!<CR>
nnoremap <Leader>3 :<C-u>set paste!<CR>
nnoremap <Leader>4 :<C-u>set wrap!<CR>
" Use <C-w> v, <C-w> n, <C-w> q
" nnoremap <Leader>5 :<C-u>to vsp<CR>
" nnoremap <Leader>6 :<C-u>bo vsp<CR>
" nnoremap <Leader>7 :<C-u>to sp<CR>
" nnoremap <Leader>9 :<C-u>q<CR>

cmap w!! w !sudo tee > /dev/null %

" auto insert --------------------------
" date, time, current directory
imap <silent> <C-i>d <C-R>=strftime("%Y年%m月%e日")<CR>
imap <silent> <C-i>t <C-R>=strftime("%H:%M")<CR>
imap <silent> <C-i>c <C-R>=getcwd()<CR>

" incremental copy
" nmap <C-i> Yp:s/\d\+/\=(submatch(0)+1)/g<CR>
nmap <C-p> Yp:s/\d\+/\=(submatch(0)+1)/<CR>

" json sort
nmap <Leader>j !python -m json.tool<CR>

" for Click to Search ---------------------
set scrolloff=0
let g:scrolloff = 15

" Do not adjust current scroll position (do not fire 'scrolloff') on single-click.
nnoremap <silent> <LeftMouse>   <Esc>:set eventignore=all<CR><LeftMouse>:set eventignore=<CR>
" Double-click for searching the word under the cursor.
nnoremap          <2-LeftMouse> g*
" Single-click for searching the word selected in visual-mode.
vmap              <LeftMouse> <Plug>(visualstar-g*)

" Grep ---------------------------------
command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
function! s:grep(args)
  execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction

" DeleteBlankLine ----------------------
command! DeleteBlankLine g/^$/d

