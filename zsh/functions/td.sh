#!/bin/zsh

# Simplified shortcut for `todo.sh`.
#
# When:
# * Given no arguments, executes `todo.sh ls`
# * Given one or more arguments, executes `todo.sh "$@"`
td() {
    if [[ $# -gt 0 ]]; then
        todo.sh "$@"
    else
        clear
        todo.sh ls
    fi
}

# Displays the default list of todo items for the current location based on `$HOSTNAME`
tt() {
    clear

    if [[ "$HOSTNAME" == "c82a14544e88" ]]; then
        todo.sh ls @Work
    else
        todo.sh ls -@Work
    fi
}

if [[ "$SHELL" = "/bin/zsh" ]]; then
    # Complete td like todo.sh
    compdef td=todo.sh
fi
