# add PATH
export PATH=$HOME/bin:$PATH

# nvm
export NVM_DIR=~/.nvm

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

case "$OSTYPE" in
  # Mac OS X
  darwin*)
    # vim
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

    # nvm
    source $(brew --prefix nvm)/nvm.sh
  ;;
esac

