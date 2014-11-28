#!/bin/zsh

td() {
    if [[ $# -gt 0 ]]; then
        todo.sh "$@"
    else
        todo.sh ls
    fi
}

if [[ "$SHELL" = "/bin/zsh" ]]; then
    # Complete td like todo.sh
    compdef td=todo.sh
fi
