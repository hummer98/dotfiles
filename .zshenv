# add PATH
case "$OSTYPE" in
  darwin*)
    export PATH=$HOME/bin:/usr/local/bin:$PATH
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

    # nvm
    source $(brew --prefix nvm)/nvm.sh

    # rbenv
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  ;;
  linux*)
    export PATH=$HOME/local/bin:/usr/local/bin:$PATH

    # rbenv
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  ;;
esac

