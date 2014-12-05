#!/bin/zsh
# Opens a man page as a PDF in OS X Preview.app

if [[ $(uname) == 'Darwin' ]]; then
    pman() {
        man -t "$@" | open -f -a Preview
    }
fi
