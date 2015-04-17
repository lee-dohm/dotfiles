#!/bin/zsh

if [[ $(uname) == "Linux" ]]; then
    export PATH="$PATH:$HOME/npm/bin"
else
    export PATH="$PATH:/usr/local/lib/node_modules"
    source "$(brew --prefix nvm)/nvm.sh"
fi
