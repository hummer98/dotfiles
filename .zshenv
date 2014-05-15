# add PATH
case "$OSTYPE" in
  darwin*)
    export PATH=$HOME/bin:/usr/local/bin:$PATH
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  ;;
  linux*)
    export PATH=$HOME/local/bin:/usr/local/bin:$PATH
  ;;
esac

