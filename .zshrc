# common -------------------------------
export LANG=ja_JP.UTF-8                 # ニッポン！

autoload -U compinit                    # 強力な補完機能らしく、これがないとzsh使っていると言えないのだとか
compinit

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim          # vim最強伝説
# bindkey -v                              # vim(ry
bindkey -e                              # emacs(ry

# color
autoload colors                         # カラーセット
colors
export LSCOLORS=gxfxcxdxbxegedabagacad

# prompt
# PROMPT="[@${HOST%%.*} %1~]%(!.#.$)"   # 表示フォーマット
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%B%{${fg[green]}%}%/ %%%{${reset_color}%} "
  PROMPT2="%B%{${fg[red]}%}%_ %%%{${reset_color}%} "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

RPROMPT="%T"                            # 時刻表示
setopt transient_rprompt                # 右まできたら、時刻非表示

setopt prompt_subst                     # 便利らしい
setopt correct


# cd
setopt auto_cd                          # 自動的にcd
setopt auto_pushd                       # cd履歴表示
setopt pushd_ignore_dups                # 同じディレクトリを履歴に追加しない


# terminal
case "${TERM}" in
kterm*|xterm)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  ;;
esac


# auto complete
setopt list_packed                      # リストを詰めて表示
setopt list_types                       # 補完一覧ファイル種別表示
setopt nolistbeep                       # 補完候補表示時のビープ音無効
setopt noautoremoveslash                # 末尾の/の自動削除機能無効
# autoload predict-on                   # auto fill (※ 強力過ぎる)
# predict-on


# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups                 # 重複を記録しない
setopt hist_reduce_blanks               # スペース排除
setopt share_history                    # 履歴ファイルを共有
setopt EXTENDED_HISTORY                 # zshの開始終了を記録

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end



setopt complete_aliases                 # デフォルトのコマンドをベースに補完
# for BSD
alias o='open'
alias ls='ls -ahGp'
alias ld='ls -ahGp | grep /'
alias ll='ls -ahGlp'
alias lld='ls -ahGlp | grep /'
# for GNU
# alias ls='ls -ahp --color=auto'
# alias ld='ls -ahp --color=auto | grep /'
# alias ll='ls -ahlp --color=auto'
# alias lld='ls -ahlp --color=auto | grep /'
alias sl='sl -ae'

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='vi'
alias gvi='gvim'
alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'

alias expdiff='bzr cdiff | iconv -f cp932'

# if .zshrc.mine is find, that readed for source.
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

