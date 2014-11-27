#!/bin/zsh

if hash todo.sh 2>/dev/null; then
    alias t="todo.sh"
    alias td="todo.sh"

    if [[ "$SHELL" = "/bin/zsh" ]]; then
        # Complete t and td like todo.sh
        compdef t=todo.sh
        compdef td=todo.sh
    fi
fi
