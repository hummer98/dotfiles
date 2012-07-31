# common -------------------------------
export LANG=ja_JP.UTF-8

autoload -U compinit                    # 強力な補完機能
compinit

# bindkey -v                              # vim
bindkey -e                              # emacs

# color
autoload colors                         # カラーセット
colors
export LSCOLORS=gxfxcxdxbxegedabagacad

# prompt
PROMPT="[@${HOST%%.*} %1~]%(!.#.$)"   # 表示フォーマット
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/ #%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_ #%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  # PROMPT="%B%{${fg[green]}%}%/ %%%{${reset_color}%}%b "
  # PROMPT="%B%{${fg[green]}%}%n %~ %%%{${reset_color}%}%b "
  # PROMPT="%B%n@%m:%(5~,%-2~/.../%2~,%~)%# "
  PROMPT="%B%{${fg[green]}%}%~ %%%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_ %%%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%B%{${fg[white]}%}${HOST%%.*} ${PROMPT}%b"
;;
esac

RPROMPT="%T"                            # 時刻表示

setopt transient_rprompt                # 右まできたら、時刻非表示
setopt prompt_subst                     # 候補自動補完

# cd
setopt auto_cd                          # ディレクトリ名実行で自動的にcd
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

case "$OSTYPE" in
darwin*)                                # for MacOS
  alias ls='ls -ahGp'
  alias ld='ls -ahGp | grep /'
  alias ll='ls -ahGlp'
  alias lld='ls -ahGlp | grep /'
;;
freebsd*)                               # for FreeBSD
  alias ls='ls -ahGp'
  alias ld='ls -ahGp | grep /'
  alias ll='ls -ahGlp'
  alias lld='ls -ahGlp | grep /'
;;
linux*)                                 # for GNU
  alias ls='ls -ahp --color=auto'
  alias ld='ls -ahp --color=auto | grep /'
  alias ll='ls -ahlp --color=auto'
  alias lld='ls -ahlp --color=auto | grep /'
;;
esac

# add PATH
case "$OSTYPE" in
  darwin*)
    export PATH=$HOME/bin:/usr/local/bin:$PATH
  ;;
esac
export JAVA_HOME=/usr/bin/java
export HADOOP_HOME=/usr/local/bin/hadoop


# add alias
case "$OSTYPE" in
  darwin*)
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'
    alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
    alias cotEditor='/Applications/CotEditor.app/Contents/MacOS/CotEditor "$@"'
    alias gvi='gvim'
  ;;
  freebsd*) # さくらのレンタルサーバ
    alias vi='~/bin/vim'
  ;;
  linux*)
    case "$USER" in
      metroid*) # さくらのVPS
        alias vi='/usr/bin/vim'
      ;;
      bkapps) #
        alias vi='~/local/bin/vim'
      ;;
    esac
  ;;
esac

alias o='open'
alias vim='vi'
alias sl='sl -ae'
alias expdiff='bzr cdiff | iconv -f cp932'

