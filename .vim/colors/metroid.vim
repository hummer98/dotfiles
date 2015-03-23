" Vim color file
" You can see the highlighting settings with the ':help hl-StatusLine'
" Maintainer: yuzuemon

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "metroid"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#666666                                                           " 'cursorline' がオンになっているときのカーソルがある画面上の行
  hi CursorColumn guibg=#666666                                                         " 'cursorcolumn' がオンになっているときのカーソルがある画面上の桁
  hi MatchParen guifg=White guibg=#ff2bfd gui=bold ctermfg=White ctermbg=Magenta cterm=none " 対応する括弧
  hi Pmenu      guifg=Black guibg=#ff2bfd ctermfg=Black ctermbg=Magenta                 " ポップアップメニュー: 通常の項目
  hi PmenuSel   guifg=DarkGreen guibg=#ff2bfd gui=bold ctermbg=Magenta ctermfg=DarkGreen cterm=none " ポップアップメニュー: 選択されている項目
  hi PmenuSbar  guibg=Black ctermbg=Black                                               " ポップアップメニュー: スクロールバー
  hi PmenuThumb ctermbg=White                                                           " ポップアップメニュー: スクロールバーのつまみ
endif


" General colors
hi Cursor guifg=NONE guibg=#00f896 gui=none                                             " カーソル下の文字
hi Normal guifg=White guibg=#242424 gui=none                                            " 通常のテキスト
hi NonText guifg=LightBlue                                                              " EOF以降の'~', '@'など
hi Visual guibg=#0d99fc ctermbg=Blue                                                       " アクティブ選択範囲
hi VisualNOS guibg=DarkBlue ctermbg=DarkBlue                                            " 非アクティブな選択範囲
hi Search guifg=Yellow guibg=Black gui=reverse,bold ctermfg=Yellow ctermbg=Black cterm=reverse,bold      " 検索文字列
hi IncSearch gui=reverse,bold cterm=reverse,bold                                        " インクリメンタル中の検索文字列
hi Folded guifg=#00fd94 guibg=DarkGray ctermbg=DarkGray                                   " 折りたたまれた行
hi FoldColumn guibg=DarkGray ctermbg=DarkGray                                           " 折りたたまれた部分
hi Title guifg=Yellow guibg=NONE gui=bold ctermfg=Yellow cterm=bold                     " ':autocmd'などの実行時の出力タイトル
hi SpecialKey guifg=#808080 guibg=#343434 gui=none


" Syntax highlighting
hi Comment guifg=MediumSpringGreen gui=italic ctermfg=Black ctermbg=DarkGreen cterm=italic " コメント
hi Todo guifg=#8f8f8f guibg=Black gui=italic ctermfg=Yellow ctermbg=Black cterm=italic  " コメント内のTODO, FIXME
hi Constant guifg=LightBlue gui=bold ctermfg=LightBlue cterm=bold                       " 定数(文字列、文字、数、Boolean)
hi Identifier guifg=#00fd94 gui=bold ctermfg=Green cterm=bold                             " 関数、識別子
hi Type guifg=Cyan gui=bold ctermfg=Cyan cterm=bold                                     " 型(クラス、構造体)
hi Statement guifg=#ff2bfd gui=bold ctermfg=Magenta cterm=bold                          " 命令、分岐
hi PreProc guifg=Yellow gui=bold ctermfg=Yellow cterm=bold                              " プリプロセッサメソッド
hi Special guifg=LightBlue gui=bold ctermfg=LightBlue cterm=bold                        " 特殊記号

hi Conditional guifg=#ff2bfd gui=bold ctermfg=Magenta cterm=bold                        " if, not
hi Repeat guifg=#ff2bfd gui=bold ctermfg=Magenta cterm=bold                             " for
hi Exception guifg=Yellow gui=bold ctermfg=Yellow cterm=bold                            " try
hi Directory guifg=#0d99fc ctermfg=Blue


" Status Line
hi StatusLine guifg=Black guibg=MediumSpringGreen gui=none ctermfg=Black ctermbg=Darkgreen cterm=none " アクティブなステータスライン
hi StatusLineNC guifg=Black guibg=AquaMarine gui=none ctermfg=Black ctermbg=Blue cterm=none " 非アクティブなステータスライン
hi Question guifg=Black guibg=Yellow gui=none ctermfg=Black ctermbg=Yellow cterm=none   " プロンプトメッセージ
hi ModeMsg guifg=#00fd94 gui=none ctermfg=DarkGreen cterm=none                            " --挿入--とかのメッセージ
hi MoreMsg guifg=#ff2bfd gui=none ctermfg=Magenta cterm=none                            " --継続--メッセージ
hi WarningMsg guifg=Yellow gui=none ctermfg=Yellow cterm=none                           " 警告メッセージ
hi ErrorMsg guifg=White guibg=#ff2bfd gui=none ctermfg=White ctermbg=Magenta cterm=none " エラーメッセージ


" diff
hi DiffAdd guibg=DarkMagenta ctermbg=DarkMagenta                                        " 追加された行行
hi DiffChange guibg=Gray30 ctermbg=DarkCyan ctermfg=White                               " 変更された行
hi DiffText guibg=DarkGreen ctermfg=Black ctermbg=DarkGreen                             " 変更された行中の変更テキスト
hi DiffDelete guifg=Black guibg=LightYellow ctermfg=Black ctermbg=Yellow                " 削除された行


" etc.
hi LineNr guifg=#00f896 guibg=#000000 gui=bold ctermfg=DarkGreen cterm=none             " 行番号
hi VertSplit guifg=Black guibg=Cyan gui=none ctermfg=Black ctermbg=Cyan cterm=none      " :vspの境界線
hi Ignore guifg=#ff2bfd guibg=Black ctermfg=Magenta ctermbg=Black
hi Error guifg=White guibg=#ff2bfd ctermfg=White ctermbg=Magenta                        " コマンド実行エラー



" TagList.vim
" hi MyTagListTagName gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
" hi MyTagListTagScope gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
" hi MyTagListTitle gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
" hi MyTagListComment gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
" hi MyTagListFileName gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
