#!/bin/sh

# No arguments: `git status`
# With arguments: acts like `git`
# Creates equivalent versions whether hub is installed or not
if hash hub 2>/dev/null; then
    g() {
        if [ $# -gt 0 ]; then
            hub "$@"
        else
            hub st
        fi
    }
else
    g() {
        if [ $# -gt 0 ]; then
            git "$@"
        else
            git st
        fi
    }
fi

# If $SHELL ends with "zsh" (rather than simply comparing directly against `/bin/zsh`)
echo "$SHELL" | grep 'zsh$' > /dev/null
if [ $? -eq 0 ]; then
    # Complete g like git
    compdef g=git
fi
