colorscheme Metroid

set background=dark

if has('mac')
	set transparency=30		" opacity
	set guifont=Monaco:h14	" font
	set columns=150			" width
	set lines=200			" line
elseif has('linux')
	set guifont=Monaco\ 12
	set columns=160
	set lines=100
endif

set mouse=a					" どのモードでもマウスを利用可能に
set nomousefocus			" マウス移動によるフォーカス切り替えを無効
set guioptions+=a
