# add PATH
case "$OSTYPE" in
  darwin*)
    export PATH=$HOME/bin:/usr/local/bin:$PATH
    export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
    export JAVA_HOME=/Library/Java/Home
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  ;;
esac

