# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions

alias ls='ls -ahp --color'
alias ll='ls -ahlp --color'
alias ld='ls -ahp --color | grep /'
