#!/bin/zsh

td() {
    if [[ $# -gt 0 ]]; then
        todo.sh "$@"
    else
        clear
        todo.sh ls
    fi
}

if [[ "$SHELL" = "/bin/zsh" ]]; then
    # Complete td like todo.sh
    compdef td=todo.sh
fi
