# common -------------------------------
export LANG=ja_JP.UTF-8
autoload -U compinit; compinit          # 強力な補完機能
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin

bindkey -e                              # emacs

# mosh
compdef mosh=ssh

# zsh-completionsを利用する(need 'brew install zsh-completions')
fpath=(/usr/local/share/zsh-completions $fpath)


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

# RPROMPT="%T"                            # 時刻表示
# コピペ
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
    color=%F{red}
  fi

  echo "$color$name$action%f%b "
}

setopt prompt_subst

RPROMPT='[`rprompt-git-current-branch`%~]'

# コピペここまで

setopt transient_rprompt                # 右まできたら、時刻非表示
setopt prompt_subst                     # 候補自動補完


# cd
setopt auto_cd                          # ディレクトリ名実行で自動的にcd
setopt auto_pushd                       # cd履歴表示
setopt pushd_ignore_dups                # 同じディレクトリを履歴に追加しない

# Input / Output
setopt dvorak

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
setopt combining_chars                  # 補完時に濁点・半濁点を<3099>、<309a>のようにさせない
# predict-on


# history
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

setopt hist_ignore_dups                 # 重複を記録しない
setopt hist_reduce_blanks               # スペース排除
setopt share_history                    # 履歴ファイルを共有
setopt extended_history                 # zshの開始終了を記録

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
    export JAVA_HOME=/Library/Java/Home
  ;;
esac


# add alias
case "$OSTYPE" in
  darwin*)
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'
    alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
    alias cot='/Applications/CotEditor.app/Contents/MacOS/CotEditor "$@"'
    alias sub='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2 "$@"'
    alias gvi='gvim'
    alias sl='sl -ae'
    alias expdiff='bzr cdiff | iconv -f cp932'
    alias rm='rmtrash'
  ;;
  linux*)
    case "$USER" in
      metroid*) # さくらのVPS
        alias vi='/usr/bin/vim'
      ;;
    esac
  ;;
esac

alias o='open'
alias history='history -f'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
