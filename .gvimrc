set background=dark
color Metroid

if has('mac')
  set transparency=10     " opacity
  set guifont=Ricty:h12   " font
  set columns=150         " width
  set lines=80            " line
  set antialias
  set imdisable
elseif has('linux')
  set guifont=Monaco\ 12
  set columns=160
  set lines=100
endif

set mouse=a               " どのモードでもマウスを利用可能に
set nomousefocus          " マウス移動によるフォーカス切り替えを無効
set guioptions+=a
set guioptions-=T
