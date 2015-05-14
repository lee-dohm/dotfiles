#!/bin/bash

if [[ $(uname) == "Linux" ]]; then
    export PATH="$PATH:$HOME/npm/bin"
else
    export NVM_DIR="$HOME/.nvm"
    export PATH="$PATH:/usr/local/lib/node_modules"
    source "$(brew --prefix nvm)/nvm.sh"
fi
