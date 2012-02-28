" Vim color file
" Maintainer:   yuzuemon

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "metroid"

" テキスト
hi Normal gui=NONE guifg=White guibg=Black                                              " 通常
hi NonText guifg=LightBlue ctermfg=LightBlue                                            " EOF以降の~など
hi Comment gui=Italic guifg=LightGreen cterm=Italic ctermfg=Black ctermbg=LightGreen                 " コメント
hi Statement gui=Bold guifg=Magenta cterm=Bold ctermfg=Magenta                            " 命令、分岐
hi Identifier gui=Bold guifg=Green cterm=Bold ctermfg=Green                             " 関数、識別子
hi PreProc gui=Bold guifg=Yellow cterm=Bold ctermfg=Yellow                              " プリプロセッサメソッド
hi Type gui=Bold guifg=Cyan cterm=Bold ctermfg=Cyan                                     " 型(クラス、構造体)
hi Constant gui=Bold guifg=LightBlue cterm=Bold ctermfg=LightBlue                       " 定数(文字列、文字、数、Boolean)
hi Special gui=Bold guifg=LightBlue cterm=Bold ctermfg=LightBlue                        " 特殊記号
hi Conditional gui=Bold guifg=Yellow cterm=Bold ctermfg=Yellow                          " if, not
hi Repeat gui=Bold guifg=Yellow cterm=Bold ctermfg=Yellow                               " for
hi Exception gui=Bold guifg=Yellow cterm=Bold ctermfg=Yellow                            " try

" テキスト状態
hi Visual guibg=Blue ctermbg=Blue                                                       " アクティブ選択範囲
hi VisualNOS guibg=DarkBlue ctermbg=DarkBlue                                            " 非アクティブな選択範囲
hi Search gui=Bold guifg=White guibg=Magenta cterm=Bold ctermfg=White ctermbg=Magenta   " 検索文字列
hi IncSearch gui=Reverse,Bold cterm=Reverse,Bold                                        " インクリメンタル中の検索文字列
hi Folded guifg=Green guibg=DarkGray ctermbg=DarkGray                                   " 折りたたまれた行
hi FoldColumn guibg=DarkGray ctermbg=DarkGray                                           " 折りたたまれた部分

" diff
hi DiffAdd guibg=DarkMagenta ctermbg=DarkMagenta                                        " 片側にある行
hi DiffDelete guifg=Black guibg=LightYellow ctermfg=Black ctermbg=LightYellow           " 片側にない行
hi DiffText guibg=DarkGreen ctermfg=Black ctermbg=DarkGreen                             " 差異のある箇所
hi DiffChange guibg=Gray30 ctermbg=DarkCyan ctermfg=White

" ポップアップメニュー(未整理)
hi Pmenu ctermbg=Magenta ctermfg=White
hi PmenuSel ctermbg=Magenta ctermfg=DarkGreen
hi PmenuSbar ctermbg=LightGreen
hi PmenuThumb ctermbg=White

" その他
hi LineNr gui=NONE guifg=Green cterm=NONE ctermfg=DarkGreen                             " 行番号
hi VertSplit gui=NONE guifg=Black guibg=Cyan cterm=NONE ctermfg=Black ctermbg=Cyan      " :vspの境界線

" TagList.vim
" hi MyTagListTagName gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
" hi MyTagListTagScope gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
" hi MyTagListTitle gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
" hi MyTagListComment gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
hi MyTagListFileName gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen

" Status Line
hi StatusLine gui=NONE guifg=Black guibg=MediumSpringGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen   " アクティブなステータスライン
hi StatusLineNC gui=NONE guifg=Black guibg=AquaMarine cterm=NONE ctermfg=Black ctermbg=Blue  " 非アクティブなステータスライン
hi Question gui=NONE guifg=Black guibg=Yellow cterm=NONE ctermfg=Black ctermbg=Yellow   " プロンプトメッセージ
hi ModeMsg gui=NONE guifg=Green cterm=NONE ctermfg=DarkGreen                                " --挿入--とかのメッセージ
hi MoreMsg gui=NONE guifg=Magenta cterm=NONE ctermfg=Magenta                            " --継続--メッセージ
hi WarningMsg gui=NONE guifg=Yellow cterm=NONE ctermfg=Yellow                           " 警告メッセージ
hi ErrorMsg gui=NONE guifg=White guibg=Magenta cterm=NONE ctermfg=White ctermbg=Magenta " エラーメッセージ

