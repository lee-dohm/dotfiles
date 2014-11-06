#!/bin/zsh

# No arguments: `git status`
# With arguments: acts like `git`
# Creates equivalent versions whether hub is installed or not
if hash hub 2>/dev/null; then
    g() {
        if [[ $# -gt 0 ]]; then
            hub "$@"
        else
            hub st
        fi
    }
else
    g() {
        if [[ $# -gt 0 ]]; then
            git "$@"
        else
            git st
        fi
    }
fi

# Complete g like git
compdef g=git
