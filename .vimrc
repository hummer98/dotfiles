" Common -------------------------------
autocmd!
set nocompatible                        " vim
" let mapleader = "\\"                    " キーマップリーダー
let mapleader = " "                    " キーマップリーダー
if filereadable(expand('$HOME/dotfiles/.vim/colors/metroid.vim'))
  colorscheme metroid
endif
color metroid

" for Plugin ---------------------------
if filereadable(expand('$HOME/dotfiles/.vimrc.neobundle'))
  source $HOME/dotfiles/.vimrc.neobundle

  if filereadable(expand('$HOME/dotfiles/.vimrc.plugin'))
    source $HOME/dotfiles/.vimrc.plugin
  endif
endif

" for Template -------------------------
if filereadable(expand('$HOME/dotfiles/.vimrc.filetype'))
  source $HOME/dotfiles/.vimrc.filetype
endif

" File ---------------------------------
set autoread                            " 更新時自動再読込み
set hidden                              " 編集中でも他のファイルを開けるようにする
set noswapfile                          " スワップファイルを作らない
set nobackup                            " バックアップを取らない
set noreadonly                          " リードオンリーにしない
autocmd BufWritePre * :%s/\s\+$//ge     " 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\t/  /ge     " 保存時にtabをスペース2つに変換する
syntax on                               " シンタックスカラーリングオン

" Indent -------------------------------
" tabstop:                                Tab文字を画面上で何文字分に展開するか
" shiftwidth:                             cindentやautoindent時に挿入されるインデントの幅
" softtabstop:                            Tabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set expandtab                           " tabをスペースに変換
" set tabstop=4 shiftwidth=4 softtabstop=0
set tabstop=2 shiftwidth=2 softtabstop=0
set autoindent smartindent              " 自動インデント，スマートインデント
set backspace=indent,eol,start          " バックスペースで特殊記号も削除可能に

" Assist imputting ---------------------
set formatoptions=lmoq                  " 整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,s,<,>,[,]           " カーソルを行頭、行末で止まらないようにする

" Complement command -------------------
set wildmenu                            " コマンド補完を強化
set wildmode=list:full                  " リスト表示，最長マッチ

" Search -------------------------------
set wrapscan                            " 最後まで検索したら先頭へ戻る
set ignorecase                          " 大文字小文字無視
set smartcase                           " 大文字ではじめたら大文字小文字無視しない
set incsearch                           " インクリメンタルサーチ
set hlsearch                            " 検索文字をハイライト
" nmap <ESC><ESC> :set nohlsearch<ESC>    " ESC2回押しでクリア
" vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR> "visual modeで選択したテキストを検索する

" View ---------------------------------
set showmatch                           " 括弧の対応をハイライト
set showcmd                             " 入力中のコマンドを表示
set showmode                            " 現在のモードを表示
set number                              " 行番号表示
set nowrap                              " 画面幅で折り返す
set list                                " 不可視文字表示
set listchars=tab:>\                    " 不可視文字の表示方法
set notitle                             " タイトル書き換えない
set scrolloff=5                         " 行送り
set display=uhex                        " 印字不可能文字を16進数で表示
" set paste                               " ペーストモード(neocomplcacheが動作しない為コメントアウト)

" Change full-pitch space's color ------
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue
match ZenkakuSpace /　/

" Set auto cursorline ------------------
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

" View active status -------------------
autocmd FocusGained * :echo "Active"
autocmd FocusLost   * :echo "Unactive"

" Clipboard ----------------------------
if has('clipboard')
  set clipboard+=autoselect
endif

" StatusLine ---------------------------
set laststatus=2                        " ステータスラインを2行に
set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

" Charset, Line ending -----------------
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set ffs=unix,dos,mac                    " LF, CRLF, CR
if exists('&ambiwidth')
  set ambiwidth=double                " UTF-8の□や○でカーソル位置がずれないようにす
endif


" --------------------------------------
"              my config
" --------------------------------------
" Add blank line
" nnoremap <C-a> :<C-u>call append(expand('.'), '')<Cr>j

" edit .vimrc
nnoremap <Leader>.   :<C-u>edit $MYVIMRC<Enter>
nnoremap <Leader>s.  :<C-u>source $MYVIMRC<Enter>
nnoremap <C-h>       :<C-u>help<Space>
map <C-e> <ESC>

" auto left
imap () ()<Left>
imap [] []<Left>
imap {} {}<Left>
imap '' ''<Left>
imap "" ""<Left>
imap <> <><Left>

" When insert mode, enable hjkl and enable go to home/end
imap <C-o> <End>
imap <C-a> <Home>
imap <C-h> <BackSpace>
" imap <C-h> <Left>
" imap <C-j> <Down>
" imap <C-k> <Up>
" imap <C-l> <Right>

" Set toggle setting
nnoremap <Leader>1 :<C-u>set number!<CR>
nnoremap <Leader>2 :<C-u>set relativenumber!<CR>
nnoremap <Leader>3 :<C-u>set paste!<CR>
nnoremap <Leader>4 :<C-u>to vsp<CR>
nnoremap <Leader>5 :<C-u>bo vsp<CR>

" auto insert --------------------------
" date, time, current directory
imap <silent> <C-i>d <C-R>=strftime("%Y年%m月%e日")<CR>
imap <silent> <C-i>t <C-R>=strftime("%H:%M")<CR>
imap <silent> <C-i>c <C-R>=getcwd()<CR>

" locate and return character 'above' current cursor position
" http://www.ibm.com/developerworks/jp/linux/library/l-vim-script-1/
function! LookupWard()
  let column_num      = virtcol('.')
  let target_pattern  = '\%' . column_num . 'v.'
  let target_line_num = search(target_pattern . '*\S', 'bnW')

  if !target_line_num
    return ""
  else
    return matchstr(getline(target_line_num), target_pattern)
  endif
endfunction
imap <silent> <C-y> <C-R><C-R>=LookupWard()<CR>

" incremental copy
" nmap <C-i> Yp:s/\d\+/\=(submatch(0)+1)/g<CR>
nmap <C-i> Yp:s/\d\+/\=(submatch(0)+1)/<CR>

" json sort
nmap <Leader>j !python -m json.tool<CR>

" When insert mode, change statusline
let g:hi_insert = 'hi StatusLine gui=None guifg=Black guibg=yellow cterm=None ctermfg=Black ctermbg=Yellow'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" for Click to Search ---------------------
set scrolloff=0
let g:scrolloff = 15

" Do not adjust current scroll position (do not fire 'scrolloff') on single-click.
nnoremap <silent> <LeftMouse>   <Esc>:set eventignore=all<CR><LeftMouse>:set eventignore=<CR>
" Double-click for searching the word under the cursor.
nnoremap          <2-LeftMouse> g*
" Single-click for searching the word selected in visual-mode.
vmap              <LeftMouse> <Plug>(visualstar-g*)

" for Opera ----------------------------
" opera -remote \"openURL()\"
function! s:ExecOpera()
  exe "! opera -remote \"openURL(%)\""
:endfunction
command! Exec call <SID>ExecOpera()
nmap <C-p> :call <SID>ExecOpera()<CR>

" Grep ---------------------------------
command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
function! s:grep(args)
  execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction

" for Vimdiff --------------------------
"if &diff
"    setup for diff mode
"else
"    setup for non-diff mode
"endif
