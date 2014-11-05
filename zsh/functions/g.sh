#!/bin/zsh

# No arguments: `git status`
# With arguments: acts like `git`
g() {
    if [[ $# -gt 0 ]]; then
        git "$@"
    else
        git st
    fi
}

# Complete g like git
compdef g=git
