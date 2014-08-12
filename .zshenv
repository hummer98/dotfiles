# add PATH
export PATH=$HOME/bin:$PATH

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

case "$OSTYPE" in
  darwin*)
    # vim
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

    # nvm
    source $(brew --prefix nvm)/nvm.sh
  ;;
esac

