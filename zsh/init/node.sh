#!/bin/bash

if [[ $(uname) == "Linux" ]]; then
    export PATH="$PATH:$HOME/npm/bin"
else
    eval "$(nodenv init -)"
    export PATH="$PATH:/usr/local/lib/node_modules"
fi
